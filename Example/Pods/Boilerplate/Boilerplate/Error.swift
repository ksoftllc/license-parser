//===--- Error.swift ------------------------------------------------------===//
//Copyright (c) 2016 Daniel Leping (dileping)
//
//Licensed under the Apache License, Version 2.0 (the "License");
//you may not use this file except in compliance with the License.
//You may obtain a copy of the License at
//
//http://www.apache.org/licenses/LICENSE-2.0
//
//Unless required by applicable law or agreed to in writing, software
//distributed under the License is distributed on an "AS IS" BASIS,
//WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and
//limitations under the License.
//===----------------------------------------------------------------------===//

import Foundation
import Result

#if swift(>=3.0)
#else
    public typealias ErrorProtocol = ErrorType
#endif

public protocol RuntimeErrorType : ErrorProtocol, CustomStringConvertible {
    var customRepresentation:String {get}
}

public extension RuntimeErrorType {
    private func selfThrow() throws {
        throw self
    }
    
    @noreturn
    func panic() {
        try! selfThrow()
        while true {}
    }
    
    var stack:[String] {
        get {
            #if !os(Linux)
                return NSThread.callStackSymbols()
            #else
                return ["Runtime error stack trace is not currently supported on Linux"]
            #endif
        }
    }
    
    var stackTrace:String {
        get {
            return "Stack trace: \(stack.description)"
        }
    }
    
    func formatDescription(custom:Any) -> String {
        return "\(custom)\n\(stackTrace)"
    }
    
    var customRepresentation:String {
        get {
            return "\(self.dynamicType)"
        }
    }
    
    var description:String {
        get {
            return formatDescription(customRepresentation)
        }
    }
}

public enum CommonRuntimeError : RuntimeErrorType {
    case NotImplemented(what:String)
    case PreconditionFailed(description:String)
    
    public var customRepresentation:String {
        get {
            switch self {
            case .NotImplemented(let what):
                return "Not implemented: \(what)"
            case .PreconditionFailed(let description):
                return "Precondition error: \(description)"
            }
        }
    }
}

public protocol AnyErrorProtocol : ErrorProtocol {
    init(_ error:ErrorProtocol)
    
    var error:ErrorProtocol {get}
}

public struct AnyError : AnyErrorProtocol {
    public let error:ErrorProtocol
    
    public init(_ error:ErrorProtocol) {
        self.error = error
    }
}

public protocol ErrorWithCodeType : ErrorProtocol {
    init(code:Int32)
    
    static func isError(code:Int32) -> Bool
}

public enum CError : RuntimeErrorType {
    case Unknown
    case Code(code:Int32)
}

extension CError : ErrorWithCodeType {
    public init(code:Int32) {
        self = .Code(code: code)
    }
    
    public static func isError(code:Int32) -> Bool {
        return code != 0
    }
}

public extension CError {
    public static let FAULT = EFAULT
    public static let INTR = EINTR
    public static let INVAL = EINVAL
}

public func ccall<Error: ErrorWithCodeType>(@noescape fun:()->Int32) -> Error? {
    let result = fun()
    return Error.isError(result) ? Error(code: result) : nil
}

public func ccall<Error: ErrorWithCodeType>(_: Error.Type, @noescape fun:()->Int32) throws {
    if let error:Error = ccall(fun) {
        throw error
    }
}

public func ccall<Value, Error: ErrorWithCodeType>(@noescape fun:(inout code:Int32)->Value) -> Result<Value, Error> {
    var code:Int32 = 0
    let result = fun(code: &code)
    if Error.isError(code) {
        return Result(error: Error(code: code))
    } else {
        return Result(value: result)
    }
}

public func ccall<Value, Error: ErrorWithCodeType>(_: Error.Type, @noescape fun:(inout code:Int32)->Value) throws -> Value {
    let result:Result<Value, Error> = ccall(fun)
    return try result.dematerialize()
}
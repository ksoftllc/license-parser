//===--- NSBridging.swift ------------------------------------------------------===//
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

#if !os(Linux)
    public protocol Bridgeable {
    }
#endif

public protocol NSBridging : Bridgeable {
    #if os(Linux)
        associatedtype NSBridgeTo = BridgeType
    #else
        associatedtype NSBridgeTo : NSObject
    #endif
}

public extension NSBridging {
    public var ns:NSBridgeTo {
        get {
            #if os(Linux)
                return self.bridge() as! NSBridgeTo
            #else
                return self as! AnyObject as! NSBridgeTo
            #endif
        }
    }
}

extension String : NSBridging {
    public typealias NSBridgeTo = NSString
}

extension Array : NSBridging {
    public typealias NSBridgeTo = NSArray
}

extension Dictionary : NSBridging {
    public typealias NSBridgeTo = NSDictionary
}

public func isNoBridge<NSType : NSObject>(any:Any, type:NSType.Type) -> Bool {
    #if os(Linux)
        //yes, otherwise we have a compiler crash
        return (any as? AnyObject).map {$0 is NSType} ?? false
    #else
        let anyType = any.dynamicType
        
        #if swift(>=3.0)
            switch anyType {
            case let anyClass as AnyClass: return anyClass.isSubclass(of: type)
            default: return false
            }
        #else
            switch anyType {
            case let anyClass as AnyClass: return anyClass.isSubclassOfClass(type)
            default: return false
            }
        #endif
    #endif
}

public func asNoBridge<NSType : NSObject>(any:Any, type:NSType.Type) -> NSType? {
    if isNoBridge(any, type: type) {
        return (any as? AnyObject).flatMap{$0 as? NSType}
    } else {
        return nil
    }
}

public func asNoBridge<NSType : NSObject>(any:Any) -> NSType? {
    return asNoBridge(any, type: NSType.self)
}
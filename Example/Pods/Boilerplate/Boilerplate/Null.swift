//===--- Null.swift ------------------------------------------------------===//
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

public enum Null {
    case null
}

extension Null : NilLiteralConvertible {
    public init(nilLiteral: ()) {
        self = .null
    }
}

public protocol NullEquatable {
    func ==(lhs: Self, rhs: Null) -> Bool
}

public func !=<NC : NullEquatable>(lhs: NC, rhs: Null) -> Bool {
    return !(lhs == rhs)
}

public func ==<T : NullEquatable>(lhs: Optional<T>, rhs: Null) -> Bool {
    return lhs.map { value in
        value == rhs
    } ?? true
}

public func !=<T : NullEquatable>(lhs: Optional<T>, rhs: Null) -> Bool {
    return !(lhs == rhs)
}

public func ==<T>(lhs: Optional<T>, rhs: Null) -> Bool {
    return lhs == nil
}

public func !=<T>(lhs: Optional<T>, rhs: Null) -> Bool {
    return lhs != nil
}

extension Null : NullEquatable {
}

public func ==(lhs: Null, rhs: Null) -> Bool {
    return lhs == rhs
}

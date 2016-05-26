//===--- Container.swift ------------------------------------------------------===//
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

postfix operator ^ {
}

postfix operator ^! {
}

postfix operator ^!! {
}

postfix operator ^% {
}

public protocol ContainerType {
    associatedtype Value
    
    func withdraw() throws -> Value
}

public postfix func ^!<A, T : ContainerType where T.Value == A>(container:T) throws -> A {
    return try container.withdraw()
}

/// Never use. Pure EVIL ]:->
public postfix func ^!!<A, T : ContainerType where T.Value == A>(container:T) -> A {
    return try! container.withdraw()
}

public postfix func ^<A, T : ContainerType where T.Value == A>(container:T) -> A? {
    return try? container.withdraw()
}

public postfix func ^%<A, T : ContainerType where T.Value == A>(container:T) -> Result<A, AnyError> {
    return materializeAny {
        try container.withdraw()
    }
}

public protocol ContainerWithErrorType : ContainerType {
    associatedtype Error : ErrorProtocol
    
    func withdrawResult() -> Result<Value, Error>
}

public extension ContainerWithErrorType {
    func withdraw() throws -> Value {
        return try withdrawResult().dematerialize()
    }
}

public extension ContainerWithErrorType where Error : AnyErrorProtocol {
    func withdraw() throws -> Value {
        return try withdrawResult().dematerializeAny()
    }
}

public postfix func ^%<A, E : ErrorProtocol, T : ContainerWithErrorType where T.Value == A, T.Error == E>(container:T) -> Result<A, E> {
    return container.withdrawResult()
}
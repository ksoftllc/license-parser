//===--- Equatable.swift ------------------------------------------------------===//
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

public protocol NonStrictEquatable {
    func isEqualTo(other:NonStrictEquatable) -> Bool
}

public func ==<A : NonStrictEquatable, B : NonStrictEquatable>(lhs:A, rhs:B) -> Bool {
    return lhs.isEqualTo(rhs)
}

public func !=<A : NonStrictEquatable, B : NonStrictEquatable>(lhs:A, rhs:B) -> Bool {
    return !lhs.isEqualTo(rhs)
}

@warn_unused_result
public func ==<T : protocol<Equatable, NonStrictEquatable>>(lhs: T, rhs: T) -> Bool {
    return lhs.isEqualTo(rhs)
}

@warn_unused_result
public func !=<T : protocol<Equatable, NonStrictEquatable>>(lhs: T, rhs: T) -> Bool {
    return !lhs.isEqualTo(rhs)
}

//I would as well add protocol Equatable to collections, but unfortunately it's not possible in current Swift (2.1 at the moment of writing)

/*public protocol NonStrictEquatableCollection {
}

extension NonStrictEquatableCollection {
    func ==<T : CollectionType where T.Generator.Element : NonStrictEquatable>(lhs: T, rhs: T) -> Bool
}*/

#if swift(>=3.0)
    
    @warn_unused_result
    public func ==<T : Collection where T.Iterator.Element == NonStrictEquatable>(lhs: T, rhs: T) -> Bool {
        if lhs.count != rhs.count {
            return false
        }
        
        let zip = lhs.zip(rhs)
        
        for (lhsv, rhsv) in zip {
            if !lhsv.isEqualTo(rhsv) {
                return false
            }
        }
        
        return true
    }
    
    /// rewritten because can return early
    @warn_unused_result
    public func !=<T : Collection where T.Iterator.Element == NonStrictEquatable>(lhs: T, rhs: T) -> Bool {
        if lhs.count != rhs.count {
            return true
        }
        
        let zip = lhs.zip(rhs)
        
        for (lhsv, rhsv) in zip {
            if lhsv.isEqualTo(rhsv) {
                return false
            }
        }
        
        return true
    }
    
#else
    
    @warn_unused_result
    public func ==<T : Collection where T.Generator.Element == NonStrictEquatable>(lhs: T, rhs: T) -> Bool {
        if lhs.count != rhs.count {
            return false
        }
    
        let zip = lhs.zip(rhs)
    
        for (lhsv, rhsv) in zip {
            if !lhsv.isEqualTo(rhsv) {
                return false
            }
        }
    
        return true
    }
    
    /// rewritten because can return early
    @warn_unused_result
    public func !=<T : Collection where T.Generator.Element == NonStrictEquatable>(lhs: T, rhs: T) -> Bool {
        if lhs.count != rhs.count {
            return true
        }
    
        let zip = lhs.zip(rhs)
    
        for (lhsv, rhsv) in zip {
            if lhsv.isEqualTo(rhsv) {
                return false
            }
        }
    
        return true
    }

#endif
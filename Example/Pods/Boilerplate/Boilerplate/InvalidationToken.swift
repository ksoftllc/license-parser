//===--- InvalidationToken.swift -------------------------------------------===//
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

public class InvalidationToken {
    //TODO: change to atomics
    private var _valid:Bool
    
    public init(valid:Bool = true) {
        self._valid = valid
    }
    
    public var valid:Bool {
        get {
            return _valid
        }
        set {
            _valid = newValue
        }
    }
}

public extension InvalidationToken {
    public func closure(f:()->Void) -> ()->Void {
        return {
            if self.valid {
                f()
            }
        }
    }
    
    public func closure<A>(f:(A)->Void) -> (A)->Void {
        return { a in
            if self.valid {
                f(a)
            }
        }
    }
    
    public func closure<A, B>(f:(A, B)->Void) -> (A, B)->Void {
        return { a, b in
            if self.valid {
                f(a, b)
            }
        }
    }
    
    public func closure<A, B, C>(f:(A, B, C)->Void) -> (A, B, C)->Void {
        return { a, b, c in
            if self.valid {
                f(a, b, c)
            }
        }
    }
    
    public func closure<A, B, C, D>(f:(A, B, C, D)->Void) -> (A, B, C, D)->Void {
        return { a, b, c, d in
            if self.valid {
                f(a, b, c, d)
            }
        }
    }
    
    public func closure<A, B, C, D, E>(f:(A, B, C, D, E)->Void) -> (A, B, C, D, E)->Void {
        return { a, b, c, d, e in
            if self.valid {
                f(a, b, c, d, e)
            }
        }
    }
    
    public func closure<A, B, C, D, E, F>(fun:(A, B, C, D, E, F)->Void) -> (A, B, C, D, E, F)->Void {
        return { a, b, c, d, e, f in
            if self.valid {
                fun(a, b, c, d, e, f)
            }
        }
    }
    
    public func closure<A, B, C, D, E, F, G>(fun:(A, B, C, D, E, F, G)->Void) -> (A, B, C, D, E, F, G)->Void {
        return { a, b, c, d, e, f, g in
            if self.valid {
                fun(a, b, c, d, e, f, g)
            }
        }
    }
    
    public func closure<A, B, C, D, E, F, G, H>(fun:(A, B, C, D, E, F, G, H)->Void) -> (A, B, C, D, E, F, G, H)->Void {
        return { a, b, c, d, e, f, g, h in
            if self.valid {
                fun(a, b, c, d, e, f, g, h)
            }
        }
    }
    
    public func closure<A, B, C, D, E, F, G, H, I>(fun:(A, B, C, D, E, F, G, H, I)->Void) -> (A, B, C, D, E, F, G, H, I)->Void {
        return { a, b, c, d, e, f, g, h, i in
            if self.valid {
                fun(a, b, c, d, e, f, g, h, i)
            }
        }
    }
    
    public func closure<A, B, C, D, E, F, G, H, I, J>(fun:(A, B, C, D, E, F, G, H, I, J)->Void) -> (A, B, C, D, E, F, G, H, I, J)->Void {
        return { a, b, c, d, e, f, g, h, i, j in
            if self.valid {
                fun(a, b, c, d, e, f, g, h, i, j)
            }
        }
    }
    
    public func closure<A, B, C, D, E, F, G, H, I, J, K>(fun:(A, B, C, D, E, F, G, H, I, J, K)->Void) -> (A, B, C, D, E, F, G, H, I, J, K)->Void {
        return { a, b, c, d, e, f, g, h, i, j, k in
            if self.valid {
                fun(a, b, c, d, e, f, g, h, i, j, k)
            }
        }
    }
}

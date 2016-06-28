//===--- C.swift ------------------------------------------------------===//
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

extension UnsafeMutablePointer : NullEquatable {
}

extension UnsafePointer : NullEquatable {
}

#if swift(>=3.0)
    public func==<T>(lhs:UnsafeMutablePointer<T>, rhs:Null) -> Bool {
        return Int(bitPattern: lhs) == 0
    }
    
    public func==<T>(lhs:UnsafePointer<T>, rhs:Null) -> Bool {
        return Int(bitPattern: lhs) == 0
    }
#else
    public func==<T>(lhs:UnsafeMutablePointer<T>, rhs:Null) -> Bool {
        return lhs == UnsafeMutablePointer(nil)
    }
    
    public func==<T>(lhs:UnsafePointer<T>, rhs:Null) -> Bool {
        return lhs == UnsafePointer(nil)
    }
#endif

#if swift(>=3.0)
#else
    public typealias OpaquePointer = COpaquePointer
    
    public extension OpaquePointer {
        public init<T>(bitPattern:Unmanaged<T>) {
            self = bitPattern.toOpaque()
        }
    }
    
    public extension UnsafePointer {
        public typealias Pointee = Memory
        
        /// Access the `Pointee` instance referenced by `self`.
        ///
        /// - Precondition: the pointee has been initialized with an instance of
        ///   type `Pointee`.
        public var pointee: Pointee {
            get {
                return self.memory
            }
        }
    }
    
    public extension UnsafeMutablePointer {
        public typealias Pointee = Memory
    
        /// Allocate and point at uninitialized aligned memory for `count`
        /// instances of `Pointee`.
        ///
        /// - Postcondition: The pointee is allocated, but not initialized.
        public init(allocatingCapacity count: Int) {
            self = UnsafeMutablePointer.alloc(count)
        }
        
        /// Deallocate uninitialized memory allocated for `count` instances
        /// of `Pointee`.
        ///
        /// - Precondition: The memory is not initialized.
        ///
        /// - Postcondition: The memory has been deallocated.
        public func deallocateCapacity(num: Int) {
            self.dealloc(num)
        }
        
        /// Access the `Pointee` instance referenced by `self`.
        ///
        /// - Precondition: the pointee has been initialized with an instance of
        ///   type `Pointee`.
        public var pointee: Pointee {
            get {
                return self.memory
            }
            nonmutating set {
                self.memory = newValue
            }
        }
        
        public func initialize(with newValue: Pointee, count: Int = 1) {
            assert(count != 1, "NOT IMPLEMENTED: currently can initialize with 1 value only")
            self.initialize(newValue)
        }
    
        /// De-initialize the `count` `Pointee`s starting at `self`, returning
        /// their memory to an uninitialized state.
        ///
        /// - Precondition: The `Pointee`s at `self..<self + count` are
        ///   initialized.
        ///
        /// - Postcondition: The memory is uninitialized.
        public func deinitialize(count count: Int = 1) {
            self.destroy(count)
        }
    }
    
    /// Returns an `UnsafePointer` to the storage used for `object`.  There's
    /// not much you can do with this other than use it to identify the
    /// object.
    public func unsafeAddress(of object: AnyObject) -> UnsafePointer<Swift.Void> {
        return unsafeAddressOf(object)
    }
    
    /// Returns the bits of `x`, interpreted as having type `U`.
    ///
    /// - Warning: Breaks the guarantees of Swift's type system; use
    ///   with extreme care.  There's almost always a better way to do
    ///   anything.
    ///
    public func unsafeBitCast<T, U>(x: T, to: U.Type) -> U {
        return unsafeBitCast(x, to)
    }
    
    /// - returns: `x as T`.
    ///
    /// - Precondition: `x is T`.  In particular, in -O builds, no test is
    ///   performed to ensure that `x` actually has dynamic type `T`.
    ///
    /// - Warning: Trades safety for performance.  Use `unsafeDowncast`
    ///   only when `x as T` has proven to be a performance problem and you
    ///   are confident that, always, `x is T`.  It is better than an
    ///   `unsafeBitCast` because it's more restrictive, and because
    ///   checking is still performed in debug builds.
    public func unsafeDowncast<T : AnyObject>(x: AnyObject, to: T.Type) -> T {
        return unsafeDowncast(x)
    }
#endif

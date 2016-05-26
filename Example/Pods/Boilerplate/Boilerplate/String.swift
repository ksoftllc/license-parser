//===--- String.swift ------------------------------------------------------===//
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

#if swift(>=3.0) && !os(Linux)
#else
    public extension String {
        public func substring(from index: Index) -> String {
            return substringFromIndex(index)
        }
        
        public func substring(to index: Index) -> String {
            return substringToIndex(index)
        }
        
        public func substring(with range: Range<String.Index>) -> String {
            return substringWithRange(range)
        }
    }
#endif

#if swift(>=3.0)
#else
    public extension String {
    
        /// Return `self` converted to lower case.
        ///
        /// - Complexity: O(n)
        public func lowercased() -> String {
            return lowercaseString
        }
    
        /// Return `self` converted to upper case.
        ///
        /// - Complexity: O(n)
        public func uppercased() -> String {
            return uppercaseString
        }
    
    }
    
    extension String {
    
        /// Create a new `String` by copying the nul-terminated UTF-8 data
        /// referenced by a `cString`.
        ///
        /// If `cString` contains ill-formed UTF-8 code unit sequences, replaces them
        /// with replacement characters (U+FFFD).
        ///
        /// - Precondition: `cString != nil`
        public init(cString: UnsafePointer<CChar>) {
            // Must crash if cString is nil
            self = String.fromCStringRepairingIllFormedUTF8(cString).0!
        }
    
        /// Create a new `String` by copying the nul-terminated UTF-8 data
        /// referenced by a `cString`.
        ///
        /// Does not try to repair ill-formed UTF-8 code unit sequences, fails if any
        /// such sequences are found.
        ///
        /// - Precondition: `cString != nil`
        public init?(validatingUTF8 cString: UnsafePointer<CChar>) {
            if cString == nil {
                CommonRuntimeError.PreconditionFailed(description: "cString is nil").panic()
            } else {
                guard let string = String.fromCString(cString) else {
                    return nil
                }
                self = string
            }
        }
    
        /// Create a new `String` by copying the nul-terminated data
        /// referenced by a `cString` using `encoding`.
        ///
        /// Returns `nil` if the `cString` is `NULL` or if it contains ill-formed code
        /// units and no repairing has been requested. Otherwise replaces
        /// ill-formed code units with replacement characters (U+FFFD).
        /*public static func decodeCString<Encoding : UnicodeCodec>(cString: UnsafePointer<Encoding.CodeUnit>, as encoding: Encoding.Type, repairingInvalidCodeUnits isRepairing: Bool = false) -> (result: String, repairsMade: Bool)? {
        //Too much work for now
        }*/
    }
    
    extension String {
        public mutating func append<S : Sequence where S.Generator.Element == Character>(contentsOf newElements: S) {
            self.appendContentsOf(newElements)
        }
        
        public mutating func append(string: String) {
            self.appendContentsOf(string)
        }
    }
    
    extension String {
        /// Insert `newElement` at position `i`.
        ///
        /// Invalidates all indices with respect to `self`.
        ///
        /// - Complexity: O(`self.count`).
        public mutating func insert(newElement: Character, at i: Index) {
            self.insert(newElement, atIndex: i)
        }
        
        /// Insert `newElements` at position `i`.
        ///
        /// Invalidates all indices with respect to `self`.
        ///
        /// - Complexity: O(`self.count + newElements.count`).
        public mutating func insert<S : Collection where S.Generator.Element == Character>(contentsOf newElements: S, at i: Index) {
            self.insertContentsOf(newElements, at: i)
        }
        
        /// Remove and return the `Character` at position `i`.
        ///
        /// Invalidates all indices with respect to `self`.
        ///
        /// - Complexity: O(`self.count`).
        public mutating func remove(at i: Index) -> Character {
            return self.removeAtIndex(i)
        }
        
        /// Replace `self` with the empty string.
        ///
        /// Invalidates all indices with respect to `self`.
        ///
        /// - parameter keepCapacity: If `true`, prevents the release of
        ///   allocated storage, which can be a useful optimization
        ///   when `self` is going to be grown again.
        public mutating func removeAll(keepingCapacity keepCapacity: Bool = true) {
            self.removeAll(keepCapacity: keepCapacity)
        }
    }
    
    public typealias UnicodeCodec = UnicodeCodecType
    
    public extension UnicodeCodec {
        /// Encode a `UnicodeScalar` as a series of `CodeUnit`s by
        /// calling `output` on each `CodeUnit`.
        public static func encode(input: UnicodeScalar, sendingOutputTo processCodeUnit: (CodeUnit) -> Swift.Void) {
            self.encode(input, output: processCodeUnit)
        }
    }
    
#endif
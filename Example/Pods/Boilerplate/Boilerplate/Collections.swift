//===--- Collections.swift ------------------------------------------------------===//
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

#if swift(>=3.0)
#else
    public typealias Collection = CollectionType
    public typealias Sequence = SequenceType
    public typealias IteratorProtocol = GeneratorType
    
    public extension Sequence where Generator.Element == String {
        public func joined(separator separator: String) -> String {
            return self.joinWithSeparator(separator)
        }
    }
    
    public extension BidirectionalIndexType {
        public func advanced(by n: Self.Distance) -> Self {
            return self.advancedBy(n)
        }
        
        public func advanced(by n: Self.Distance, limit: Self) -> Self {
            return self.advancedBy(n, limit: limit)
        }
    
        public func distance(to other: Self) -> Distance {
            return self.distanceTo(other)
        }
    }
    
    extension Array {
        /// Append the elements of `newElements` to `self`.
        ///
        /// - Complexity: O(*length of result*).
        public mutating func append<S : Sequence where S.Generator.Element == Element>(contentsOf newElements: S) {
            self.appendContentsOf(newElements)
        }
        
        /// Append the elements of `newElements` to `self`.
        ///
        /// - Complexity: O(*length of result*).
        //public mutating func append<C : Collection where C.Generator.Element == Element>(contentsOf newElements: C) {
        //    return self.appendContentsOf(newElements)
        //}
        
        public mutating func insert<C : Collection where C.Generator.Element == Element>(contentsOf newElements: C, at i: Int) {
            self.insertContentsOf(newElements, at: i)
        }
        
        /// Insert `newElement` at index `i`.
        ///
        /// - Precondition: `i <= count`.
        ///
        /// - Complexity: O(`self.count`).
        public mutating func insert(newElement: Element, at i: Int) {
            return self.insert(newElement, atIndex: i)
        }
        
        /// Remove and return the element at index `i`.
        ///
        /// Invalidates all indices with respect to `self`.
        ///
        /// - Complexity: O(`self.count`).
        public mutating func remove(at index: Int) -> Element {
            return self.removeAtIndex(index)
        }
        
        /// Remove all elements.
        ///
        /// - Postcondition: `capacity == 0` iff `keepCapacity` is `false`.
        ///
        /// - Complexity: O(`self.count`).
        public mutating func removeAll(keepingCapacity keepCapacity: Bool) {
            return self.removeAll(keepCapacity: keepCapacity)
        }
    }
    
    extension Collection {
        /// Returns `self[startIndex..<end]`
        ///
        /// - Complexity: O(1)
        public func prefix(upTo end: Self.Index) -> Self.SubSequence {
            return self.prefixUpTo(end)
        }
        
        /// Returns `self[start..<endIndex]`
        ///
        /// - Complexity: O(1)
        public func suffix(from start: Self.Index) -> Self.SubSequence {
            return self.suffixFrom(start)
        }
        
        /// Returns `prefix(upTo: position.successor())`
        ///
        /// - Complexity: O(1)
        public func prefix(through position: Self.Index) -> Self.SubSequence {
            return self.prefixThrough(position)
        }
        
        /// Returns the maximal `SubSequence`s of `self`, in order, that
        /// don't contain elements satisfying the predicate `isSeparator`.
        ///
        /// - Parameter maxSplits: The maximum number of `SubSequence`s to
        ///   return, minus 1.
        ///   If `maxSplits + 1` `SubSequence`s are returned, the last one is
        ///   a suffix of `self` containing *all* the elements of `self` following the
        ///   last split point.
        ///   The default value is `Int.max`.
        ///
        /// - Parameter omittingEmptySubsequences: If `false`, an empty `SubSequence`
        ///   is produced in the result for each pair of consecutive elements
        ///   satisfying `isSeparator`.
        ///   The default value is `true`.
        ///
        /// - Precondition: `maxSplits >= 0`
        public func split(maxSplits maxSplits: Int = Int.max, omittingEmptySubsequences: Bool, @noescape isSeparator: (Self.Generator.Element) throws -> Bool) rethrows -> [Self.SubSequence] {
            return try self.split(maxSplits, allowEmptySlices: !omittingEmptySubsequences, isSeparator: isSeparator)
        }
    }
    
    public extension Sequence {
        public typealias Iterator = Generator
        
        public func makeIterator() -> Iterator {
            return generate()
        }
    }
#endif

public protocol CopyableCollectionType : Collection {
    #if swift(>=3.0)
    init<C : Sequence where C.Iterator.Element == Iterator.Element>(_ s:C)
    #else
    init<C : Sequence where C.Generator.Element == Generator.Element>(_ s:C)
    #endif
}

extension Array : CopyableCollectionType {
}

extension Set : CopyableCollectionType {
}

public extension CopyableCollectionType {
    public typealias EnumeratorCallback = (Generator.Element) -> Void
    public typealias Enumerator = (EnumeratorCallback) -> Void
    
    public init(enumerator:Enumerator) {
        var array = Array<Generator.Element>()
        enumerator { element in
            array.append(element)
        }
        self.init(array)
    }
}

public class ZippedSequence<A, B where A : IteratorProtocol, B : IteratorProtocol> : Sequence {
    #if swift(>=3.0)
    public typealias Iterator = AnyIterator<(A.Element, B.Element)>
    #else
    public typealias Generator = AnyGenerator<(A.Element, B.Element)>
    public typealias Iterator = Generator
    #endif
    
    var ag:A
    var bg:B
    
    public init(ag:A, bg:B) {
        self.ag = ag
        self.bg = bg
    }
    
    
    #if swift(>=3.0)
    #else
    public func generate() -> Generator {
        return makeIterator()
    }
    #endif
    
    public func makeIterator() -> Iterator {
        return Iterator {
            guard let a = self.ag.next() else {
                return nil
            }
            guard let b = self.bg.next() else {
                return nil
            }
            
            return (a, b)
        }
    }
}

#if swift(>=3.0)
    public extension Sequence {
        public func zip<T : Sequence>(other:T) -> ZippedSequence<Iterator, T.Iterator> {
            return ZippedSequence(ag: self.makeIterator(), bg: other.makeIterator())
        }
    }
#else
    public extension Sequence {
        public func zip<T : Sequence>(other:T) -> ZippedSequence<Generator, T.Generator> {
            return ZippedSequence(ag: self.generate(), bg: other.generate())
        }
    }
#endif
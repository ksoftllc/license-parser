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
    public typealias OptionSet = OptionSetType
    
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
    
    public extension Range {
        public typealias Bound = Element
        
        /// Creates an instance with the given bounds.
        ///
        /// Because this initializer does not perform any checks, it should be used
        /// as an optimization only when you are absolutely certain that `lower` is
        /// less than or equal to `upper`. Using the half-open range operator
        /// (`..<`) to form `Range` instances is preferred.
        ///
        /// - Parameter bounds: A tuple of the lower and upper bounds of the range.
        public init(uncheckedBounds bounds: (lower: Bound, upper: Bound)) {
            self = bounds.lower..<bounds.upper
        }
        
        /// The range's lower bound.
        ///
        /// In an empty range, `lowerBound` is equal to `upperBound`.
        public var lowerBound: Bound {
            get {
                return startIndex
            }
        }
        
        /// The range's upper bound.
        ///
        /// In an empty range, `upperBound` is equal to `lowerBound`. A `Range`
        /// instance does not contain its upper bound.
        public var upperBound: Bound {
            get {
                return endIndex
            }
        }
        
        /// Returns a Boolean value indicating whether the given element is contained
        /// within the range.
        ///
        /// Because `Range` represents a half-open range, a `Range` instance does not
        /// contain its upper bound. `element` is contained in the range if it is
        /// greater than or equal to the lower bound and less than the upper bound.
        ///
        /// - Parameter element: The element to check for containment.
        /// - Returns: `true` if `element` is contained in the range; otherwise,
        ///   `false`.
        public func contains(element: Bound) -> Bool {
            return self.contains({$0 == element})
        }
        
        /// A Boolean value indicating whether the range contains no elements.
        ///
        /// An empty `Range` instance has equal lower and upper bounds.
        ///
        ///     let empty: Range = 10..<10
        ///     print(empty.isEmpty)
        ///     // Prints "true"
        /*already exists public var isEmpty: Bool {
            get {
                return self.isEmpty
            }
        }*/
        
        /// Creates an instance equivalent to the given range.
        ///
        /// - Parameter other: A range to convert to a `Range` instance.
        //already exists public init(_ other: Range<Bound>)
    }
    
    public extension Range where Element : Comparable {
        /// Returns a Boolean value indicating whether this range and the given range
        /// contain an element in common.
        ///
        /// For example:
        ///
        ///     let x: Range = 0..<20
        ///     print(x.overlaps(10..<1000 as Range))
        ///     // Prints "true"
        ///
        /// - Parameter other: A range to check for elements in common.
        /// - Returns: `true` if this range and `other` have at least one element in
        ///   common; otherwise, `false`.
        public func overlaps(other: Range<Bound>) -> Bool {
            return self.lowerBound < other.upperBound || self.upperBound > other.lowerBound
        }
        
        /// Returns a Boolean value indicating whether this range and the given range
        /// contain an element in common.
        ///
        /// For example:
        ///
        ///     let x: Range = 0..<20
        ///     print(x.overlaps(10...1000 as ClosedRange))
        ///     // Prints "true"
        ///
        /// - Parameter other: A range to check for elements in common.
        /// - Returns: `true` if this range and `other` have at least one element in
        ///   common; otherwise, `false`.
        /*unapplicable public func overlaps(other: ClosedRange<Bound>) -> Bool {
            
        }*/
        
        /// Returns a copy of this range clamped to the given limiting range.
        ///
        /// The bounds of the result are always limited to the bounds of `limits`.
        /// For example:
        ///
        ///     let x: Range = 0..<20
        ///     print(x.clamped(to: 10..<1000))
        ///     // Prints "10..<20"
        ///
        /// If the two ranges do not overlap, the result is an empty range within the
        /// bounds of `limits`.
        ///
        ///     let y: Range = 0..<5
        ///     print(y.clamped(to: 10..<1000))
        ///     // Prints "10..<10"
        ///
        /// - Parameter limits: The range to clamp the bounds of this range.
        /// - Returns: A new range clamped to the bounds of `limits`.
        public func clamped(to limits: Range<Bound>) -> Range<Bound> {
            let lower = min(max(lowerBound, limits.lowerBound), limits.upperBound)
            let upper = max(min(upperBound, limits.upperBound), limits.lowerBound)
            return Range(uncheckedBounds: (lower: lower, upper: upper))
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
        public func zip<T : Sequence>(_ other:T) -> ZippedSequence<Iterator, T.Iterator> {
            return ZippedSequence(ag: self.makeIterator(), bg: other.makeIterator())
        }
    }
#else
    public extension Sequence {
        public func zip<T : Sequence>(_ other:T) -> ZippedSequence<Generator, T.Generator> {
            return ZippedSequence(ag: self.generate(), bg: other.generate())
        }
    }
#endif

postfix operator ^ {}

#if swift(>=3.0)
    public func toMap<K : Hashable, V, S : Sequence where S.Iterator.Element == (K, V)>(_ seq:S) -> Dictionary<K, V> {
        var dict = Dictionary<K, V>()
        for (k, v) in seq {
            dict[k] = v
        }
        return dict
    }
    
    //Frankly, I would prefer to avoid operator syntax here and implement it as an extension, but can not find a solution. If somebody has - feel free to submit, please.
    public postfix func ^<K : Hashable, V, S : Sequence where S.Iterator.Element == (K, V)>(seq:S) -> Dictionary<K, V> {
        return toMap(seq)
    }
#else
    public func toMap<K : Hashable, V, S : Sequence where S.Generator.Element == (K, V)>(seq:S) -> Dictionary<K, V> {
        var dict = Dictionary<K, V>()
        for (k, v) in seq {
            dict[k] = v
        }
        return dict
    }
    
    //Frankly, I would prefer to avoid operator syntax here and implement it as an extension, but can not find a solution. If somebody has - feel free to submit, please.
    public postfix func ^<K : Hashable, V, S : Sequence where S.Generator.Element == (K, V)>(seq:S) -> Dictionary<K, V> {
        return toMap(seq)
    }
#endif


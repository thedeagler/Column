//
//  Array+Appending.swift
//  Column
//
//  Created by Stephen Wu on 5/14/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import Foundation

extension Array {

    /// Creates a copy of the array with the given element appended to the end.
    ///
    /// - Parameter element: Element to append
    /// - Returns: A new array with the new element appended to the end of the old array
    func appending(_ element: Element) -> [Element] {
        var copy = self
        copy.append(element)
        return copy
    }

    /// Creates a copy of the array with the given elements appended to the end.
    ///
    /// - Parameter element: Element to append
    /// - Returns: A new array with the new elements appended to the end of the old array
    func appending(_ elements: [Element]) -> [Element] {
        var copy = self
        copy.append(contentsOf: elements)
        return copy
    }
}

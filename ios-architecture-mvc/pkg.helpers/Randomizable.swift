//
//  Randomizable.swift
//  ios-architecture-mvc
//
//  Created by Dorin Danciu on 08/09/2018.
//  Copyright © 2018 Beilmo. All rights reserved.
//

import Foundation

public protocol Randomizable {
    static func random() -> Self
    static func listOfRandom(_ upperBound: UInt) -> [Self]
}

extension Randomizable {
    public static func listOfRandom(_ upperBound: UInt = 100) -> [Self] {
        var items = [Self]()
        for _ in 0...upperBound {
            items.append(random())
        }

        return items
    }
}

extension Sequence where Element: Randomizable {
    public static func random() -> [Element]  {
        return Element.listOfRandom()
    }
}

//extension Array where Element: Randomizable {
//    public static func random() -> [Element]  {
//        return Element.listOfRandom()
//    }
//}

extension Array: Randomizable where Element: Randomizable {
    public static func random() -> [Element]  {
        return Element.listOfRandom()
    }
}

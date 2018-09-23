//
//  Random.swift
//  ios-architecture-mvc
//
//  Created by Dorin Danciu on 08/09/2018.
//  Copyright © 2018 Beilmo. All rights reserved.
//

import Foundation

enum Random {
    enum Title {
        static func book() -> String {
            return [
                "Secrets of the Milionarie Mind",
                "Swift Style",
                "Cocoa Programing for MacOS",
                "ObjC IO App Architecture",
                "The 80/20 principle",
                "Refactoring to patterns"
            ].randomElement()!
        }

        static func publication() -> String {
            return [
                "Forbes",
                "National Geografic",
                "MacLife",
                "Times"
                ].randomElement()!
        }

        static func talk() -> String {
            return [
                "Localizing with Xcode 9",
                "Introducing ARKit: Augmented Reality in iOS",
                "Introducing HEIF and HEVC",
                "New localization workflows in Xcode 10",
                "What's new in CocoaTouch",
                "Advanced CollectionViews"
                ].randomElement()!
        }
    }
}

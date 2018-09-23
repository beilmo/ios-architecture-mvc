//
//  Presentation.swift
//  ios-architecture-mvc
//
//  Created by Dorin Danciu on 08/09/2018.
//  Copyright © 2018 Beilmo. All rights reserved.
//

import Foundation

public struct Presentation: Codable {

    public struct Content: Codable {

        public enum State: Int, Codable {
            case unloaded
            case loaded
            case loading
            case downloaded
            case downloading
        }

        public var presentationId: String

        public var state: State

        public var thumbnailUrl: URL

        public var remoteVideoUrl: URL

        public var localVideoUrl: URL?
    }

    public var id: String

    public var title: String

    public var subtitle: String

    public var isFavorite: Bool

    public var description: String

    public var content: Content?

    public var relatedPresentations: [Presentation]?
}

extension Presentation {
    public var hasContent: Bool {
        return content != nil
    }
}

extension Presentation: Randomizable {
    public static func random() -> Presentation {
        return Presentation(id: UUID().uuidString,
                            title: Random.Title.talk(),
                            subtitle: Random.Title.publication(),
                            isFavorite: arc4random_uniform(100) % 2 == 0,
                            description: "",
                            content: nil,
                            relatedPresentations:nil)
    }
}

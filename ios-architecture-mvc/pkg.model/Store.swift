//
//  Store.swift
//  ios-architecture-mvc
//
//  Created by Dorin Danciu on 08/09/2018.
//  Copyright © 2018 Beilmo. All rights reserved.
//

import Foundation

public enum ChangeType: String {
    case update
    case delete
}

public protocol Store {

    func presentationList() -> Resource<[Presentation]>

//    func change(_ presentation: Presentation) -> Resource<()>

    func content(of: Presentation) -> Resource<Presentation.Content>

//    func downloadedContentList() -> Resource<Presentation.Content>

    func relatedPresentations(of: Presentation) -> Resource<[Presentation]>
    
}

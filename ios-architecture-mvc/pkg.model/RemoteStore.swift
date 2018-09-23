//
//  RemoteStore.swift
//  ios-architecture-mvc
//
//  Created by Dorin Danciu on 08/09/2018.
//  Copyright © 2018 Beilmo. All rights reserved.
//

import Foundation

public struct RemoteStore {
    let hostName: String
    let port: Int

    var baseUrl: URL {
        return URL(string: "http://\(hostName):\(port)")!
    }

    init(hostName: String, port: Int) {
        self.hostName = hostName
        self.port = port
    }
}

fileprivate extension String {
    static let presentationList = "/presentations"
    static let presentationContent = "/presentation/content/%@"
    static let relatedPresentations = "/presentation/related/%@"
}

extension RemoteStore: Store {

    public func presentationList() -> Resource<[Presentation]> {
        let url = baseUrl.appendingPathComponent(.presentationList)

        return Resource(url: url)
    }

    public func content(of: Presentation) -> Resource<Presentation.Content> {
        let component = String(format: .presentationContent, of.id)
        let url = baseUrl.appendingPathComponent(component)

        return Resource(url: url)
    }

    public func relatedPresentations(of: Presentation) -> Resource<[Presentation]> {
        let component = String(format: .relatedPresentations, of.id)
        let url = baseUrl.appendingPathComponent(component)

        return Resource(url: url)
    }

}

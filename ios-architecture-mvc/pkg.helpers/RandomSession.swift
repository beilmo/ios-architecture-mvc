//
//  RandomSession.swift
//  ios-architecture-mvc
//
//  Created by Dorin Danciu on 08/09/2018.
//  Copyright © 2018 Beilmo. All rights reserved.
//

import Foundation

struct RandomSession {
    static var shared: RandomSession = RandomSession()
}

extension RandomSession {

    func load<T>(_ resource: Resource<T>, completion: @escaping (Result<T, AnyError>) -> ()) where T: Randomizable {
        DispatchQueue.main.async {
            completion(.success(T.random()))
        }
    }

}

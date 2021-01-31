//
//  PokemonClient.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation
import Alamofire

protocol PokemonClientProtocol {
    func getAll(completionHandler: @escaping (([PokemonResponse]) -> ()))
}

class PokemonClient: PokemonClientProtocol {

    private let baseApiClient: BaseApiClient

    init(baseApiClient: BaseApiClient) {
        self.baseApiClient = baseApiClient
    }

    func getAll(completionHandler: @escaping (([PokemonResponse]) -> ())) {
        baseApiClient.executeAndReturn(path: "/pokemon/all", method: .get, resultType: [PokemonResponse].self) { (result) in
            completionHandler(result)
        }

//        return [
//            PokemonResponse(id: 1, name: "Mew-Two", imageId: "Mew-Two", difficulty: DifficultyModel(id: 5, level: 5)),
//            PokemonResponse(id: 2, name: "Magmortar", imageId: "Magmortar", difficulty: DifficultyModel(id: 4, level: 4)),
//            PokemonResponse(id: 3, name: "Snorlax", imageId: "Snorlax", difficulty: DifficultyModel(id: 3, level: 3)),
//            PokemonResponse(id: 4, name: "Togetic", imageId: "Togetic", difficulty: DifficultyModel(id: 3, level: 3)),
//            PokemonResponse(id: 5, name: "Darkrai", imageId: "Darkrai", difficulty: DifficultyModel(id: 4, level: 4))
//        ]
    }
}

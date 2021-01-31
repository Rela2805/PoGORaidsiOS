//
//  PokemonDataSource.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

protocol PokemonDataSourceProtocol {
    func getAll(completionHandler: @escaping (([PokemonDataModel]) -> ()))
}

class PokemonDataSource: PokemonDataSourceProtocol {

    private let client: PokemonClientProtocol

    init(client: PokemonClientProtocol) {
        self.client = client
    }

    func getAll(completionHandler: @escaping (([PokemonDataModel]) -> ())) {
        client.getAll { pokemons in
            completionHandler(pokemons.map { PokemonDataModel(from: $0) })
        }
    }

}

//
//  CreateRaidPresenter.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

class CreateRaidPresenter {

    private let router: AppRouterProtocol
    private let useCase: RaidUseCaseProtocol

    init(router: AppRouterProtocol, useCase: RaidUseCaseProtocol) {
        self.router = router
        self.useCase = useCase
    }

    func getAllPokemons(completionHandler: @escaping (([PokemonModel]) -> ())) {
        useCase.getAllPokemons { pokemons in
            completionHandler(pokemons)
        }
    }

    func createRaid(minimalLevel: Int, pokemonName: String) {
        useCase.create(minimalLevel: minimalLevel, pokemonName: pokemonName)
    }

}

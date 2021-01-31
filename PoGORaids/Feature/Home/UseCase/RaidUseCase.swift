//
//  RaidUseCase.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

protocol RaidUseCaseProtocol {
    func getAllPokemons(completionHandler: @escaping (([PokemonModel]) -> ()))
    func create(minimalLevel: Int, pokemonName: String)
    func delete(raidId: Int)
    func getRaid(raidId: Int, completionHandler: @escaping ((RaidModel) ->()))
    func getAll(completionHandler: @escaping (([RaidModel]) ->()))
    func joinRaid(raidId: Int)
    func leaveRaid(raidId: Int)
}

class RaidUseCase: RaidUseCaseProtocol {

    private let pokemonDataSource: PokemonDataSourceProtocol
    private let raidDataSource: RaidDataSourceProtocol
    private let userDefaultsService: UserDefaultsServiceProtocol

    init(pokemonDataSource: PokemonDataSourceProtocol, raidDataSource: RaidDataSourceProtocol, userDefaultsService: UserDefaultsServiceProtocol) {
        self.pokemonDataSource = pokemonDataSource
        self.raidDataSource = raidDataSource
        self.userDefaultsService = userDefaultsService
    }

    func getAllPokemons(completionHandler: @escaping (([PokemonModel]) -> ())) {
        pokemonDataSource.getAll { pokemons in
            completionHandler(pokemons.map { PokemonModel(from: $0) })
        }
    }

    func create(minimalLevel: Int, pokemonName: String) {
        guard let userId = userDefaultsService.getUserId() else { return }

        let request = RaidRequest(minimalLevel: minimalLevel, pokemonName: pokemonName, creatorId: userId)
        raidDataSource.create(raidRequest: request) { raid in }
    }

    func delete(raidId: Int) {
        guard let userId = userDefaultsService.getUserId() else { return }

        raidDataSource.delete(raidId: raidId, userId: userId)
    }

    func getRaid(raidId: Int, completionHandler: @escaping ((RaidModel) ->())) {
        raidDataSource.getRaid(raidId: raidId) { raid in
            completionHandler(RaidModel(from: raid))
        }
    }

    func getAll(completionHandler: @escaping (([RaidModel]) ->())) {
        raidDataSource.getAll() { raids in
            completionHandler(raids.map { RaidModel(from: $0) })
        }
    }

    func joinRaid(raidId: Int) {
        guard let userId = userDefaultsService.getUserId() else { return }

        raidDataSource.joinRaid(raidId: raidId, userId: userId)
    }

    func leaveRaid(raidId: Int) {
        guard let userId = userDefaultsService.getUserId() else { return }

        raidDataSource.leaveRaid(raidId: raidId, userId: userId)
    }

}

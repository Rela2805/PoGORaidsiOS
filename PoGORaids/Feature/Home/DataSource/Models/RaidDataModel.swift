//
//  RaidDataModel.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

struct RaidDataModel {
    let id: Int
    let minimalLevel: Int
    let pokemon: PokemonDataModel
    let creator: UserDataModel
    let contenders: [UserDataModel]
}

extension RaidDataModel {
    init(from model: RaidReposnse) {
        id = model.id
        minimalLevel = model.minimalLevel
        pokemon = PokemonDataModel(from: model.pokemon)
        creator = UserDataModel(from: model.creator)
        contenders = model.contendors.map { UserDataModel(from: $0) }
    }
}

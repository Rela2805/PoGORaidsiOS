//
//  RaidModel.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

struct RaidModel {
    let id: Int
    let minimalLevel: Int
    let pokemon: PokemonModel
    let creator: UserModel
    let contenders: [UserModel]
}

extension RaidModel {
    init(from model: RaidDataModel) {
        id = model.id
        minimalLevel = model.minimalLevel
        pokemon = PokemonModel(from: model.pokemon)
        creator = UserModel(from: model.creator)
        contenders = model.contenders.map { UserModel(from: $0) }
    }
}

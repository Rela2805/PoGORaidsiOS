//
//  PokemonModel.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

struct PokemonModel {
    let id: Int
    let name: String
    let imageId: String
    let difficulty: DifficultyModel
}

extension PokemonModel {
    init(from model: PokemonDataModel) {
        id = model.id
        name = model.name
        imageId = model.imageId
        difficulty = model.difficulty
    }
}

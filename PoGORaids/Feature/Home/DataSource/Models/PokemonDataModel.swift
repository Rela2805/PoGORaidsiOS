//
//  PokemonDataModel.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

struct PokemonDataModel {
    let id: Int
    let name: String
    let imageId: String
    let difficulty: DifficultyModel
}

extension PokemonDataModel {
    init(from model: PokemonResponse) {
        id = model.id
        name = model.name
        imageId = model.imageId
        difficulty = model.difficulty
    }
}

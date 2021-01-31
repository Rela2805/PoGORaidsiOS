//
//  PokemonResponse.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

struct PokemonResponse: Decodable {
    let id: Int
    let name: String
    let imageId: String
    let difficulty: DifficultyModel
}

struct DifficultyModel: Decodable {
    let id: Int
    let level: Int
}

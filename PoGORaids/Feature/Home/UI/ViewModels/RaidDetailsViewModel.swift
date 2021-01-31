//
//  RaidDetailsViewModel.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

struct RaidDetailsViewModel {
    let id: Int
    let minimalLevel: Int
    let pokemonName: String
    let pokemonImage: String
    let contenders: [RaidDetailsUserViewModel]
    let creator: RaidDetailsUserViewModel
}

extension RaidDetailsViewModel {
    init(from model: RaidModel) {
        id = model.id
        minimalLevel = model.minimalLevel
        pokemonName = model.pokemon.name
        pokemonImage = model.pokemon.imageId
        contenders = model.contenders.map { RaidDetailsUserViewModel(from: $0) }
        creator = RaidDetailsUserViewModel(from: model.creator)
    }
}

//
//  RaidResponse.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

struct RaidReposnse: Decodable {
    let id: Int
    let minimalLevel: Int
    let pokemon: PokemonResponse
    let creator: UserReposnse
    let contendors: [UserReposnse]
}

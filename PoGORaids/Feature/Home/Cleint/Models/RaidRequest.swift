//
//  RaidRequest.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

struct RaidRequest: Encodable {
    let minimalLevel: Int
    let pokemonName: String
    let startTime: Int = 0
    let creatorId: Int
}

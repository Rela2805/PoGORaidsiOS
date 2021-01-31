//
//  RaidDetailsUserViewModel.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

struct RaidDetailsUserViewModel {
    let code: String
    let nickname: String
    let level: Int
}

extension RaidDetailsUserViewModel {
    init(from model: UserModel) {
        code = model.gameCode
        nickname = model.gameNickname
        level = model.level
    }
}

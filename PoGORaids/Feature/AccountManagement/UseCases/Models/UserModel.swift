//
//  UserModel.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation
struct UserModel {

    let id: Int
    let name: String
    let surname: String
    let username: String
    let email: String
    let raidsCompleted: Int
    let gameNickname: String
    let gameCode: String
    let level: Int
    let team: TeamModel
}

extension UserModel {

    init(from model: UserDataModel) {
        self.id = model.id
        self.name = model.name
        self.surname = model.surname
        self.email = model.email
        self.username = model.username
        self.raidsCompleted = model.raidsCompleted
        self.gameNickname = model.gameNickname
        self.gameCode = model.gameCode
        self.level = model.level
        self.team = TeamModel(from: model.team)
    }

}

struct TeamModel {
    let id: Int
    let color: TeamColor
}

extension TeamModel {

    init(from model: TeamDataModel) {
        id = model.id
        color = model.color
    }
}

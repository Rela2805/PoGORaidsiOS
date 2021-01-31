//
//  UserDataModel.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

struct UserDataModel {

    let id: Int
    let name: String
    let surname: String
    let username: String
    let email: String
    let raidsCompleted: Int
    let gameNickname: String
    let gameCode: String
    let level: Int
    let team: TeamDataModel
}

extension UserDataModel {

    init(from model: UserReposnse) {
        self.id = model.id
        self.name = model.name
        self.surname = model.surname
        self.email = model.email
        self.username = model.username
        self.raidsCompleted = model.raidsCompleted
        self.gameNickname = model.gameNickname
        self.gameCode = model.gameCode
        self.level = model.level
        self.team = TeamDataModel(from: model.team)
    }

}

struct TeamDataModel {
    let id: Int
    let color: TeamColor
}

extension TeamDataModel {

    init(from model: TeamResponse) {
        id = model.id
        color = model.color
    }
}

//
//  UserResponse.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/30/21.
//

import Foundation

struct UserReposnse: Decodable {
    let id: Int
    let name: String
    let surname: String
    let email: String
    let username: String
    let raidsCompleted: Int
    let gameNickname: String
    let gameCode: String
    let level: Int
    let team: TeamResponse
}

struct TeamResponse: Decodable {
    let id: Int
    let color: TeamColor
}

enum TeamColor: String, Decodable {
    case yellow
    case blue
    case red
}

//
//  UserRequest.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/30/21.
//

import Foundation

struct UserRequest: Encodable {

    let name: String
    let surname: String
    let email: String
    let username: String
    let password: String
    let gameNickname: String
    let gameCode: String
    let level: Int
    let color: String

}

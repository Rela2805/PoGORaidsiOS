//
//  UserDefaultsService.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

fileprivate let userIdKey = "userId"

protocol UserDefaultsServiceProtocol {
    func saveUser(user: UserModel)
    func removeUser()
    func getUserId() -> Int?
}

class UserDefaultsService: UserDefaultsServiceProtocol {
    func saveUser(user: UserModel) {
        UserDefaults.standard.setValue(user.id, forKey: userIdKey)
    }

    func removeUser() {
        UserDefaults.standard.removeObject(forKey: userIdKey)
    }
    func getUserId() -> Int? {
        return UserDefaults.standard.value(forKey: userIdKey) as? Int
    }
}

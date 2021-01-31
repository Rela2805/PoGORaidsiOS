//
//  UserDataSource.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

protocol UserDataSourceProtocol {
    func login(email: String, password: String, completionHandler: @escaping ((UserDataModel) -> ()))
    func register(userModel: UserRequest, completionHandler: @escaping ((UserDataModel) -> ()))
    func editProfile(userModel: UserRequest, userId: Int) -> Void
    func deleteProfile(id: Int) -> Void
    func getUser(id: Int, completionHandler: @escaping ((UserDataModel) -> ()))
}

class UserDataSource: UserDataSourceProtocol {

    private let userClient: UserClientProtocol

    init(userClient: UserClientProtocol) {
        self.userClient = userClient
    }

    func login(email: String, password: String, completionHandler: @escaping ((UserDataModel) -> ())) {
        userClient.login(email: email, password: password) { user in
            completionHandler(UserDataModel(from: user))
        }
    }

    func register(userModel: UserRequest, completionHandler: @escaping ((UserDataModel) -> ())) {
        userClient.register(userModel: userModel) { user in
            completionHandler(UserDataModel(from: user))
        }
    }

    func editProfile(userModel: UserRequest, userId: Int) {
        userClient.editProfile(userModel: userModel, userId: userId)
    }

    func deleteProfile(id: Int) {
        userClient.deleteProfile(id: id)
    }

    func getUser(id: Int, completionHandler: @escaping ((UserDataModel) -> ())) {
        userClient.getUser(id: id) { user in
            completionHandler(UserDataModel(from: user))
        }
    }

}

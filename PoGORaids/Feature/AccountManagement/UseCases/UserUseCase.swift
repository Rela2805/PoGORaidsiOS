//
//  UserUseCase.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

protocol UserUseCaseProtocol {
    func login(email: String, password: String, completionHandler: @escaping (() -> ()))
    func register(userModel: UserRequest, completionHandler: @escaping (() -> ()))
    func editProfile(userModel: UserRequest) -> Void
    func deleteProfile() -> Void
    func getUser(completionHandler: @escaping ((UserModel?) -> ()))
    func logout() -> Void
}

class UserUseCase: UserUseCaseProtocol {

    private let userDefaultsService: UserDefaultsServiceProtocol
    private let userDataSource: UserDataSourceProtocol

    init(userDefaultsService: UserDefaultsServiceProtocol, userDataSource: UserDataSourceProtocol) {
        self.userDefaultsService = userDefaultsService
        self.userDataSource = userDataSource
    }

    func login(email: String, password: String, completionHandler: @escaping (() -> ())) {
        userDataSource.login(email: email, password: password) { [weak self] user in
            let userModel = UserModel(from: user)
            self?.userDefaultsService.saveUser(user: userModel)
            completionHandler()
        }
    }

    func register(userModel: UserRequest, completionHandler: @escaping (() -> ())) {
        userDataSource.register(userModel: userModel) { [weak self] user in
            self?.userDefaultsService.saveUser(user: UserModel(from: user))
            completionHandler()
        }
    }

    func editProfile(userModel: UserRequest) {
        guard let userId = userDefaultsService.getUserId() else { return }
        userDataSource.editProfile(userModel: userModel, userId: userId)
    }

    func deleteProfile() {
        guard let id = userDefaultsService.getUserId() else { return }

        userDataSource.deleteProfile(id: id)
        userDefaultsService.removeUser()
    }

    func getUser(completionHandler: @escaping ((UserModel?) -> ())) {
        guard let id = userDefaultsService.getUserId() else { return completionHandler(nil) }

        userDataSource.getUser(id: id) { user in
            completionHandler(UserModel(from: user))
        }
    }

    func logout() {
        userDefaultsService.removeUser()
    }
}

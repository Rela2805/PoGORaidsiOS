//
//  ProfileDetailsPresenter.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

class ProfileDetailsPresenter {

    private let router: AppRouterProtocol
    private let userUseCase: UserUseCaseProtocol

    init(router: AppRouterProtocol, userUseCase: UserUseCaseProtocol) {
        self.router = router
        self.userUseCase = userUseCase
    }

    func getUserData(completionHandler: @escaping ((UserModel?) -> ())) {
        userUseCase.getUser() { user in
            completionHandler(user)
        }
    }

    func handleSaveChanges(
        fullname: String,
        email: String,
        username: String,
        password: String,
        gameNick: String,
        level: String
    ) {
        let fn = String(fullname.split(separator: " ")[0])
        let ln = String(fullname.split(separator: " ")[1])

        let userRequest = UserRequest(
            name: fn,
            surname: ln,
            email: email,
            username: username,
            password: password,
            gameNickname: gameNick,
            gameCode: "",
            level: Int(level) ?? 0,
            color: "")
        userUseCase.editProfile(userModel: userRequest)
    }

    func handleDeleteAccount() {
        userUseCase.deleteProfile()
        router.showLoginScreen()
    }

    func handleLogout() {
        userUseCase.logout()
        router.showLoginScreen()
    }

}

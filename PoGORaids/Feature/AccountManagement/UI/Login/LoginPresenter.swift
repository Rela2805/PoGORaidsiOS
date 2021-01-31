//
//  LoginPResenter.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/30/21.
//

import Foundation

class LoginPresenter {

    private let router: AppRouterProtocol
    private let useCase: UserUseCaseProtocol

    init(router: AppRouterProtocol, useCase: UserUseCaseProtocol) {
        self.router = router
        self.useCase = useCase
    }

    func handleLogin(email: String, password: String) {
        useCase.login(email: email, password: password) { [weak self] in
            DispatchQueue.main.async { [weak self] in
                self?.router.showHomeScreen()
            }
        }
    }

    func handleRegister() {
        router.showRegisterScreen()
    }
}

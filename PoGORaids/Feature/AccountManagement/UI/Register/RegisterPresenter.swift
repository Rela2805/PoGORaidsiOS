//
//  RegisterPresenter.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

class RegisterPresenter {

    private let router: AppRouterProtocol
    private let userUseCase: UserUseCaseProtocol
    private let teamUseCase: TeamUseCaseProtocol

    init(router: AppRouterProtocol, userUseCase: UserUseCaseProtocol, teamUseCase: TeamUseCaseProtocol) {
        self.router = router
        self.userUseCase = userUseCase
        self.teamUseCase = teamUseCase
    }

    func getTeams(completionHandler: @escaping (([TeamModel]) -> ())){
        teamUseCase.getAllTeams { teams in
            completionHandler(teams)
        }
    }

    func handleRegister(
        fullname: String,
        email: String,
        username: String,
        password: String,
        gameNick: String,
        gameCode: String,
        level: String,
        team: String
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
            gameCode: gameCode,
            level: Int(level) ?? 0,
            color: team)

        userUseCase.register(userModel: userRequest) { [weak self] in
            DispatchQueue.main.async { [weak self] in
                self?.router.showHomeScreen()
            }
        }
    }
}

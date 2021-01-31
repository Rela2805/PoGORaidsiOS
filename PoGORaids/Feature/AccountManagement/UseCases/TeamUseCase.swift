//
//  TeamUseCase.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

protocol TeamUseCaseProtocol {
    func getAllTeams(completionHandler: @escaping (([TeamModel]) -> ()))
}

class TeamUseCase: TeamUseCaseProtocol {

    private let dataSource: TeamDataSurceProtocol

    init(dataSource: TeamDataSurceProtocol) {
        self.dataSource = dataSource
    }

    func getAllTeams(completionHandler: @escaping (([TeamModel]) -> ())) {
        dataSource.getAllTeams { teams in
            completionHandler(teams.map { TeamModel(from: $0) })
        }
    }

}

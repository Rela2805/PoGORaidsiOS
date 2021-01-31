//
//  TeamDataSurceProtocol.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

protocol TeamDataSurceProtocol {
    func getAllTeams(completionHandler: @escaping (([TeamDataModel]) -> ()))
}

class TeamDataSource: TeamDataSurceProtocol {

    private let client: TeamClientProtocol

    init(client: TeamClientProtocol) {
        self.client = client
    }

    func getAllTeams(completionHandler: @escaping (([TeamDataModel]) -> ())) {
        client.getAllTeams { teams in
            completionHandler(teams.map { TeamDataModel(from: $0) })
        }
    }
}

//
//  TeamClient.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

protocol TeamClientProtocol {
    func getAllTeams(completionHandler: @escaping (([TeamResponse]) -> ()))
}

class TeamClient: TeamClientProtocol {

    private let baseApiClient: BaseApiClient

    init(baseApiClient: BaseApiClient) {
        self.baseApiClient = baseApiClient
    }

    func getAllTeams(completionHandler: @escaping (([TeamResponse]) -> ())) {
        baseApiClient.executeAndReturn(path: "/team/all", method: .get, resultType: [TeamResponse].self, completionHandler: { teams in
            completionHandler(teams)
        })
    }

}

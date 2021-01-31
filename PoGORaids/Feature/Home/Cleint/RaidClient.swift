//
//  RaidClient.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

protocol RaidClientProtocol {
    func create(raidRequest: RaidRequest, completionHandler: @escaping ((RaidReposnse) -> ()))
    func delete(raidId: Int, userId: Int)
    func getRaid(raidId: Int, completionHandler: @escaping ((RaidReposnse) -> ()))
    func getAll(completionHandler: @escaping (([RaidReposnse]) -> ()))
    func joinRaid(raidId: Int, userId: Int)
    func leaveRaid(raidId: Int, userId: Int)
}

class RaidClient: RaidClientProtocol {

    private let baseApiClient: BaseApiClient

    init(baseApiClient: BaseApiClient) {
        self.baseApiClient = baseApiClient
    }

    func create(raidRequest: RaidRequest, completionHandler: @escaping ((RaidReposnse) -> ())) {
        baseApiClient.executeAndReturn(path: "/raid", method: .post, body: raidRequest, resultType: RaidReposnse.self) { raid in
            completionHandler(raid)
        }
    }

    func delete(raidId: Int, userId: Int) {
        baseApiClient.execute(path: "/raid/\(raidId)/\(userId)", method: .delete)
    }

    func getRaid(raidId: Int, completionHandler: @escaping ((RaidReposnse) -> ())) {
        baseApiClient.executeAndReturn(path: "/raid/\(raidId)", method: .get, resultType: RaidReposnse.self) { raid in
            completionHandler(raid)
        }
    }

    func getAll(completionHandler: @escaping (([RaidReposnse]) -> ())) {
        baseApiClient.executeAndReturn(path: "/raid/all", method: .get, resultType: [RaidReposnse].self) { raids in
            completionHandler(raids)
        }
    }

    func joinRaid(raidId: Int, userId: Int) {
        baseApiClient.execute(path: "/raid/join/\(raidId)/\(userId)", method: .patch)
    }

    func leaveRaid(raidId: Int, userId: Int) {
        baseApiClient.execute(path: "/raid/leave/\(raidId)/\(userId)", method: .patch)
    }

}

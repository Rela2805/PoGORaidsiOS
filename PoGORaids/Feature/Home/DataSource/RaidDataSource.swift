//
//  RaidDataSource.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

protocol RaidDataSourceProtocol {
    func create(raidRequest: RaidRequest, completionHandler: @escaping ((RaidDataModel) -> ()))
    func delete(raidId: Int, userId: Int)
    func getRaid(raidId: Int, completionHandler: @escaping ((RaidDataModel) -> ()))
    func getAll(completionHandler: @escaping (([RaidDataModel]) -> ()))
    func joinRaid(raidId: Int, userId: Int)
    func leaveRaid(raidId: Int, userId: Int)
    
}

class RaidDataSource: RaidDataSourceProtocol {

    private let client: RaidClientProtocol

    init(client: RaidClientProtocol) {
        self.client = client
    }

    func create(raidRequest: RaidRequest, completionHandler: @escaping ((RaidDataModel) -> ())) {
        client.create(raidRequest: raidRequest) { raid in
            completionHandler(RaidDataModel(from: raid))
        }
    }

    func delete(raidId: Int, userId: Int) {
        client.delete(raidId: raidId, userId: userId)
    }

    func getRaid(raidId: Int, completionHandler: @escaping ((RaidDataModel) -> ())) {
        client.getRaid(raidId: raidId) { raid in
            completionHandler(RaidDataModel(from: raid))
        }
    }

    func getAll(completionHandler: @escaping (([RaidDataModel]) -> ())){
        return client.getAll() { raids in
            completionHandler(raids.map { RaidDataModel(from: $0) })
        }
    }

    func joinRaid(raidId: Int, userId: Int) {
        client.joinRaid(raidId: raidId, userId: userId)
    }

    func leaveRaid(raidId: Int, userId: Int) {
        client.leaveRaid(raidId: raidId, userId: userId)
    }

}

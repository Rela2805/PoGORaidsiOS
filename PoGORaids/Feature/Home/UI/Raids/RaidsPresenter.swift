//
//  RaidsPresenter.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

class RaidsPresenter {

    private let router: AppRouterProtocol
    private let raidUseCase: RaidUseCaseProtocol

    init(router: AppRouterProtocol, raidUseCase: RaidUseCaseProtocol) {
        self.router = router
        self.raidUseCase = raidUseCase
    }

    func getRaids(completionHandler: @escaping (([RaidModel]) ->())) {
        raidUseCase.getAll() { raids in completionHandler(raids) }
    }

    func handleSelectedItem(raidId: Int) {
        router.showRaidDetailsScreen(raidId: raidId)
    }
}

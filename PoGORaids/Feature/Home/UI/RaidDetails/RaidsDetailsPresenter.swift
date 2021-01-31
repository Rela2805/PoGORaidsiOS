//
//  RaidsDetailsPresenter.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import Foundation

class RaidsDetailsPresenter {

    private let router: AppRouterProtocol
    private let raidUseCase: RaidUseCaseProtocol
    private let raidId: Int

    init(router: AppRouterProtocol, raidUseCase: RaidUseCaseProtocol, raidId: Int) {
        self.router = router
        self.raidUseCase = raidUseCase
        self.raidId = raidId
    }

    func getRaidInfo(completionHandler: @escaping((RaidDetailsViewModel) -> ())) {
        raidUseCase.getRaid(raidId: raidId) { raid in
            completionHandler(RaidDetailsViewModel(from: raid))
        }
    }

    func joinRaid(completionHandler: @escaping((RaidDetailsViewModel) -> ())) {
        raidUseCase.joinRaid(raidId: raidId)

        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 3) { [weak self] in
            guard let self = self else { return }

            self.raidUseCase.getRaid(raidId: self.raidId) { raid in
                completionHandler(RaidDetailsViewModel(from: raid))
            }
        }
    }

    func leaveRaid(completionHandler: @escaping((RaidDetailsViewModel) -> ())) {
        raidUseCase.leaveRaid(raidId: raidId)

        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 3) { [weak self] in
            guard let self = self else { return }

            self.raidUseCase.getRaid(raidId: self.raidId) { raid in
                completionHandler(RaidDetailsViewModel(from: raid))
            }
        }
    }

    func deleteRaid() {
        raidUseCase.delete(raidId: raidId)
        router.goBack()
    }

}

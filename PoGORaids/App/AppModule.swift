//
//  AppModule.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/30/21.
//

import Foundation
import Resolver

class AppModule {

    private lazy var container: Resolver = {
        let container = Resolver()
        registerDependencies(in: container)
        return container
    }()

    lazy var appRouter: AppRouterProtocol = {
        return container.resolve()
    }()

    private func registerDependencies(in container: Resolver) {
        container
            .register(AppRouterProtocol.self) { AppRouter(container: container, userDefaultsService: container.resolve()) }
            .scope(Resolver.application)

        registerControllers(in: container)
        registerPresenters(in: container)
        registerUseCases(in: container)
        registerDataSources(in: container)
        registerClients(in: container)
        registerServices(in: container)
    }

    private func registerControllers(in container: Resolver) {
        container
            .register { LoginViewController(presenter: container.resolve()) }
            .scope(Resolver.unique)
        container
            .register { RegisterViewController(presenter: container.resolve()) }
            .scope(Resolver.unique)
        container
            .register { ProfileDetailsViewController(presenter: container.resolve()) }
            .scope(Resolver.unique)
        container
            .register { CreateRaidViewController(presenter: container.resolve()) }
            .scope(Resolver.unique)
        container
            .register { (_, arg) -> RaidsDetailsViewController? in
                guard let raidId = arg as? Int else { return nil }

                let presenter = container.resolve(RaidsDetailsPresenter.self, args: raidId)
                return RaidsDetailsViewController(presenter: presenter)
            }
            .scope(Resolver.unique)
        container
            .register { RaidsViewController(presenter: container.resolve()) }
            .scope(Resolver.unique)
    }

    private func registerPresenters(in container: Resolver) {
        container
            .register { LoginPresenter(router: container.resolve(), useCase: container.resolve()) }
            .scope(Resolver.unique)
        container
            .register { RegisterPresenter(router: container.resolve(), userUseCase: container.resolve(), teamUseCase: container.resolve()) }
            .scope(Resolver.unique)
        container
            .register { ProfileDetailsPresenter(router: container.resolve(), userUseCase: container.resolve()) }
            .scope(Resolver.unique)
        container
            .register { CreateRaidPresenter(router: container.resolve(), useCase: container.resolve()) }
            .scope(Resolver.unique)
        container
            .register { (_, arg) -> RaidsDetailsPresenter? in
                guard let raidId = arg as? Int else { return nil }

                return RaidsDetailsPresenter(router: container.resolve(), raidUseCase: container.resolve(), raidId: raidId)
            }
            .scope(Resolver.unique)
        container
            .register { RaidsPresenter(router: container.resolve(), raidUseCase: container.resolve()) }
            .scope(Resolver.unique)
    }

    private func registerUseCases(in container: Resolver) {
        container
            .register(UserUseCaseProtocol.self) { UserUseCase(userDefaultsService: container.resolve(), userDataSource: container.resolve()) }
            .scope(Resolver.application)
        container
            .register(RaidUseCaseProtocol.self) { RaidUseCase(pokemonDataSource: container.resolve(), raidDataSource: container.resolve(), userDefaultsService: container.resolve()) }
            .scope(Resolver.application)
        container
            .register(TeamUseCaseProtocol.self) { TeamUseCase(dataSource: container.resolve()) }
            .scope(Resolver.application)
    }

    private func registerDataSources(in container: Resolver) {
        container
            .register(UserDataSourceProtocol.self) { UserDataSource(userClient: container.resolve()) }
            .scope(Resolver.application)
        container
            .register(RaidDataSourceProtocol.self) { RaidDataSource(client: container.resolve()) }
            .scope(Resolver.application)
        container
            .register(PokemonDataSourceProtocol.self) { PokemonDataSource(client: container.resolve()) }
            .scope(Resolver.application)
        container
            .register(TeamDataSurceProtocol.self) { TeamDataSource(client: container.resolve()) }
            .scope(Resolver.application)
    }

    private func registerClients(in container: Resolver) {
        container
            .register(UserClientProtocol.self) { UserClient(baseApiClient: container.resolve()) }
            .scope(Resolver.application)
        container
            .register(TeamClientProtocol.self) { TeamClient(baseApiClient: container.resolve()) }
            .scope(Resolver.application)
        container
            .register(PokemonClientProtocol.self) { PokemonClient(baseApiClient: container.resolve()) }
            .scope(Resolver.application)
        container
            .register(RaidClientProtocol.self) { RaidClient(baseApiClient: container.resolve()) }
            .scope(Resolver.application)
    }

    private func registerServices(in container: Resolver) {
        container
            .register(UserDefaultsServiceProtocol.self) { UserDefaultsService() }
            .scope(Resolver.application)
        container
            .register{ BaseApiClient() }
            .scope(Resolver.application)
    }
}

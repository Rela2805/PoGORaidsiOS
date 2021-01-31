//
//  AppRouter.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/30/21.
//

import UIKit
import Resolver

protocol AppRouterProtocol {
    func start(in window: UIWindow?)
    func showRegisterScreen()
    func showHomeScreen()
    func showLoginScreen()
    func showRaidDetailsScreen(raidId: Int)
    func goBack()
}

class AppRouter: AppRouterProtocol{

    private let container: Resolver
    private let userDefaultsService: UserDefaultsServiceProtocol
    private let navigationController = UINavigationController()

    init(container: Resolver, userDefaultsService: UserDefaultsServiceProtocol) {
        self.container = container
        self.userDefaultsService = userDefaultsService
    }

    func start(in window: UIWindow?) {
        if let _ = userDefaultsService.getUserId() {
            let raidsController = container.resolve(RaidsViewController.self)
            raidsController.tabBarItem = UITabBarItem(title: "Raids", image: UIImage(named: "list"), selectedImage: UIImage(named: "list"))
            let createRaidController = container.resolve(CreateRaidViewController.self)
            createRaidController.tabBarItem = UITabBarItem(title: "Create", image: UIImage(named: "add"), selectedImage: UIImage(named: "add"))
            let profileDetailsController = container.resolve(ProfileDetailsViewController.self)
            profileDetailsController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "user"), selectedImage: UIImage(named: "user"))

            let tabBarController = UITabBarController()
            tabBarController.viewControllers = [raidsController, createRaidController, profileDetailsController]

            navigationController.viewControllers = [tabBarController]
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        } else {
            let controller = container.resolve(LoginViewController.self)

            navigationController.viewControllers = [controller]
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }
    }

    func showRegisterScreen() {
        let controller = container.resolve(RegisterViewController.self)

        navigationController.pushViewController(controller, animated: true)
    }

    func showHomeScreen() {
        let raidsController = container.resolve(RaidsViewController.self)
        raidsController.tabBarItem = UITabBarItem(title: "Raids", image: UIImage(named: "list"), selectedImage: UIImage(named: "list"))
        let createRaidController = container.resolve(CreateRaidViewController.self)
        createRaidController.tabBarItem = UITabBarItem(title: "Create", image: UIImage(named: "add"), selectedImage: UIImage(named: "add"))
        let profileDetailsController = container.resolve(ProfileDetailsViewController.self)
        profileDetailsController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "user"), selectedImage: UIImage(named: "user"))

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [raidsController, createRaidController, profileDetailsController]

        navigationController.viewControllers = [tabBarController]
    }

    func showLoginScreen() {
        let controller = container.resolve(LoginViewController.self)

        navigationController.viewControllers = [controller]
    }

    func showRaidDetailsScreen(raidId: Int) {
        let controller = container.resolve(RaidsDetailsViewController.self, args: raidId)

        navigationController.pushViewController(controller, animated: true)
    }

    func goBack() {
        navigationController.popViewController(animated: true)
    }

}

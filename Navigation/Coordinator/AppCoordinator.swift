//
//  AppCoordinator.swift
//  Navigation
//
//  Created by Roman Romanov on 18.04.2023.
//

import UIKit

final class AppCoordinator: Coordinatable {
    private(set) var childCoordinators: [Coordinatable] = []
    
    private let factory: AppFactory
    
    init(factory: AppFactory) {
        self.factory = factory
    }
    
    func start() -> UIViewController {
        let feedCoordinator = (modulType: .feed, factory: factory)
        let loginCoordinator = (modulType: .login, factory: factory)
        
        let appTabBarController = AppTabBarController(viewControllers: [
            feedCoordinator.start(),
            loginCoordinator.start(),
        ])
        
        addChildCoordinator(feedCoordinator)
        addChildCoordinator(loginCoordinator)
        
        return appTabBarController
    }
    
    func addChildCoordinator(_ coordinator: Coordinatable) {
        guard !childCoordinators.contains(where: { $0 === coordinator } ) else {
            return
        }
        
        childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: Coordinatable) {
        childCoordinators = childCoordinators.filter( { $0 === coordinator } )
    }
}

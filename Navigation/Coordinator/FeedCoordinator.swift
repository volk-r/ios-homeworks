//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by Roman Romanov on 18.04.2023.
//

import UIKit

final class FeedCoordinator: ModuleCoordinatable {
    let moduleType: Module.ModuleType
    
    private let factory: AppFactory
    
    private(set) var coordinator: [Coordinatable] = []
    private(set) var module: Module?
    
    init(moduleType: Module.ModuleType, factory: AppFactory) {
        self.moduleType = moduleType
        self.factory = factory
    }
    
    func start() -> UIViewController {
        let module = factory.makeModuleType(ofType: moduleType)
        let viewController = module.view
        viewController.tabBarItem = moduleType.tabBarItem
        self.module = module
        return viewController
    }
    
    
}

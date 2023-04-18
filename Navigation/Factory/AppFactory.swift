//
//  Factory.swift
//  Navigation
//
//  Created by Roman Romanov on 17.04.2023.
//

import UIKit

final class AppFactory {
    func makeModuleType(ofType moduleType: Module.ModuleType) -> Module {
        switch moduleType {
        case .feed:
            let feedVC = FeedViewController()
            let view = UINavigationController(rootViewController: feedVC)
            return Module(modulType: moduleType, view: view)
        case .login:
            let loginVC = LogInViewController()
            let view = UINavigationController(rootViewController: loginVC)
            loginVC.loginDelegate = MyLoginFactory().makeLoginInspector()
            return Module(modulType: moduleType, view: view)
        }
    }
}

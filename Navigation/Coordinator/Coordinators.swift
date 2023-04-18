//
//  Coordinators.swift
//  Navigation
//
//  Created by Roman Romanov on 17.04.2023.
//

import UIKit

protocol Coordinatable: AnyObject {
    var coordinator: [Coordinatable] { get }
    func start() -> UIViewController
    func addChildCoordinator(_ coordinator: Coordinatable)
    func removeChildCoordinator(_ coordinator: Coordinatable)
}

protocol ModuleCoordinatable: Coordinatable {
    var module: Module { get }
    var moduleType: Module.ModuleType { get }
}

extension Coordinatable {
    func addChildCoordinator(_ coordinator: Coordinatable) {}
    func removeChildCoordinator(_ coordinator: Coordinatable) {}
}

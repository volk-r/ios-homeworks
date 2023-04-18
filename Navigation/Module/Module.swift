//
//  Module.swift
//  Navigation
//
//  Created by Roman Romanov on 17.04.2023.
//

import UIKit

struct Module {
    enum ModuleType {
        case feed
        case login
    }
    
    let modulType: ModuleType
    let view: UIViewController
}

extension Module.ModuleType {
    var tabBarItem: UITabBarItem {
        switch self {
        case .feed:
            return UITabBarItem(title: "Лента", image: UIImage(systemName: "house.fill"), tag: 0)
        case .login:
            return UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.fill"), tag: 1)
        }
    }
}

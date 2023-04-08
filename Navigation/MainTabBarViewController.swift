//
//  MainTabBarViewController.swift
//  Navigation
//
//  Created by Roman Romanov on 03.02.2023.
//

import UIKit

final class MainTabBarViewController: UITabBarController {

    private let feedVC = FeedViewController()
    private let loginVC = LogInViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCotrollers()
    }

    private func setupCotrollers() {
        let navigationControllerFeed = UINavigationController(rootViewController: feedVC)
        let navigationControllerLogin = UINavigationController(rootViewController: loginVC)
        navigationControllerLogin.navigationBar.isHidden = true

        feedVC.tabBarItem.title = "Лента"
        feedVC.tabBarItem.image = UIImage(systemName: "house.fill")
        
        loginVC.tabBarItem.title = "Профиль"
        loginVC.tabBarItem.image = UIImage(systemName: "person.fill")
        loginVC.loginDelegate = LoginInspector()

        viewControllers = [navigationControllerFeed, navigationControllerLogin]
    }

}

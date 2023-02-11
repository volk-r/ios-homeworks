//
//  MainTabBarViewController.swift
//  Navigation
//
//  Created by Roman Romanov on 03.02.2023.
//

import UIKit

final class MainTabBarViewController: UITabBarController {

    private let feedVC = FeedViewController()
    private let profileVC = ProfileViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCotrollers()
    }

    private func setupCotrollers() {
        let navigationControllerFeed = UINavigationController(rootViewController: feedVC)
        let navigationControllerProfile = UINavigationController(rootViewController: profileVC)

        feedVC.tabBarItem.title = "Лента"
        feedVC.tabBarItem.image = UIImage(systemName: "house.fill")

        profileVC.tabBarItem.title = "Профиль"
        profileVC.tabBarItem.image = UIImage(systemName: "person.fill")

        viewControllers = [navigationControllerFeed, navigationControllerProfile]
    }

}

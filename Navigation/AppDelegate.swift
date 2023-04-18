//
//  AppDelegate.swift
//  Navigation
//
//  Created by Roman Romanov on 03.02.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

//        let feedVC = MainTabBarViewController()
//        let navigationController = UINavigationController(rootViewController: feedVC)
//
//        window?.rootViewController = navigationController
        
        let factory = AppFactory()
        let appCoordinator = AppCoordinator(factory: factory)
        
//        window?.rootViewController = MainTabBarViewController()
        window?.rootViewController = appCoordinator.start()
        window?.makeKeyAndVisible()

        return true
    }


}


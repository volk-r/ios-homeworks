//
//  LogInViewController.swift
//  Navigation
//
//  Created by Roman Romanov on 16.02.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let loginView = LoginView()
    
    override func loadView() {
        super.loadView()
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.navigationBar.isHidden = true // it needed?
    }
    
}

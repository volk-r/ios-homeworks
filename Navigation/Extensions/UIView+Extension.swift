//
//  ProfileViewController+extensions.swift
//  Navigation
//
//  Created by Roman Romanov on 18.02.2023.
//

import UIKit

extension UIView {
    static var identifier: String {
        String(describing: self)
    }
    
    func autoLayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}

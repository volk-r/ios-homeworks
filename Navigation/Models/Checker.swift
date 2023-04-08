//
//  Checker.swift
//  Navigation
//
//  Created by Roman Romanov on 08.04.2023.
//

import Foundation

protocol LoginViewControllerDelegate: AnyObject {
    func check()
}

final class Checker {
    static let shared = Checker()
    
    private let email: String = AppConstant.emailLoginValue
    private let phone: String = AppConstant.phoneLoginValue
    private let password: String = AppConstant.passwordValue
    
    private init() {}
    
    func check(login: String, password: String) -> Bool {
        print("login -> \(self.email) | \(self.phone)")
        print("password -> \(self.password)")
        guard login == self.email || login == self.phone else { print("login mismath"); return false }
        guard password == self.password else { print("passwotd mismath"); return false }
        
        print("success")
        return true
    }
}

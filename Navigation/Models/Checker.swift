//
//  Checker.swift
//  Navigation
//
//  Created by Roman Romanov on 08.04.2023.
//

import Foundation

final class Checker {
    static let shared = Checker()
    
    private let email: String = AppConstant.emailLoginValue
    private let phone: String = AppConstant.phoneLoginValue
    private let password: String = AppConstant.passwordValue
    
    private init() {}
    
    func check(login: String, password: String) -> Bool {
        guard login == self.email || login == self.phone else { print("login mismath"); return false }
        guard password == self.password else { print("passwotd mismath"); return false }
        
        print("success")
        return true
    }
}

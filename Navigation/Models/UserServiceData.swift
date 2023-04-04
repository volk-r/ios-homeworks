//
//  UserServiceData.swift
//  UserService
//
//  Created by Roman Romanov on 04.04.2023.
//

import UIKit

protocol UserServiceProtocol: AnyObject {
    func getUserByLogin(_ login: String) -> User?
}

final class CurrentUserService: UserServiceProtocol {
    
    func getUserByLogin(_ login: String) -> User? {
        guard login == AppConstant.emailLoginValue || login == AppConstant.phoneLoginValue else { return nil }
        
        return User(
            email: AppConstant.emailLoginValue,
            phone: AppConstant.phoneLoginValue,
            fullName: "Senior iOS developer",
            avatar: UIImage(named: "avatar")!,
            status: "I can be God"
        )
    }
    
}

final class TestUserService: UserServiceProtocol {
    
    func getUserByLogin(_ login: String) -> User? {
        return User(
            email: "test@mail.com",
            phone: "123456789",
            fullName: "Junior iOS developer",
            avatar: UIImage(named: "avatar")!,
            status: "I am just learning"
        )
    }
    
    
}

final class User {
    private var email: String
    private var phone: String
    private var fullName: String
    private var avatar: UIImage
    private var status: String
    
    init(email: String, phone: String, fullName: String, avatar: UIImage, status: String) {
        self.email = email
        self.phone = phone
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
    
    func getName() -> String {
        return self.fullName
    }
    
    func getLoginEmail() -> String {
        return self.email
    }
    
    func getLoginPhone() -> String {
        return self.phone
    }
    
    func getAvatar() -> UIImage {
        return self.avatar
    }
    
    func getStatus() -> String {
        return self.status
    }
}


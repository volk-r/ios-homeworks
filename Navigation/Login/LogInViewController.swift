//
//  LogInViewController.swift
//  Navigation
//
//  Created by Roman Romanov on 16.02.2023.
//

import UIKit

final class LogInViewController: UIViewController {
    
    private let notification = NotificationCenter.default
    private let loginView = LoginView()
    
    override func loadView() {
        super.loadView()
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notification.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notification.removeObserver(UIResponder.keyboardWillShowNotification)
        notification.removeObserver(UIResponder.keyboardWillHideNotification)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            loginView.scrollView.contentInset.bottom = keyboardSize.height
            loginView.scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        loginView.scrollView.contentInset = .zero
        loginView.scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    private func setupButton() {
        loginView.loginButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        loginView.loginTextField.addTarget(self, action: #selector(editing(_ :)), for: .editingDidBegin)
        loginView.passwordTextField.addTarget(self, action: #selector(editing(_ :)), for: .editingDidBegin)
        loginView.passwordTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }
    
    @objc private func editingChanged() {
        loginView.warningLabel.isHidden = true
    }
    
    @objc private func editing(_ sender: UITextField) {
        setDefaultBorder(sender)
    }
    
    private func setDefaultBorder(_ sender: UITextField) {
        sender.layer.borderColor = UIColor.lightGray.cgColor
        sender.layer.borderWidth = 0.5
    }
    
    @objc private func buttonPressed() {
        guard validation() == true else { return }
        
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    private func validation() -> Bool {
        if loginView.loginTextField.text!.isEmpty {
            loginView.loginTextField.shake()
            return false
        }
        
        if loginView.loginTextField.text!.isValidEmail() == false
            && loginView.loginTextField.text!.isValidPhone() == false {
            loginView.loginTextField.shake()
            callAlert()
            return false
        }
        
        if loginView.passwordTextField.text!.isEmpty {
            loginView.passwordTextField.shake()
            return false
        }
        
        if loginView.passwordTextField.text!.count < AppConstant.passMinLength
            || loginView.passwordTextField.text!.count > AppConstant.passMaxLength {
            loginView.warningLabel.isHidden = false
            return false
        }
        
        guard loginView.passwordTextField.text == AppConstant.passwordValue
                && (
                    loginView.loginTextField.text == AppConstant.emailLoginValue
                    || loginView.loginTextField.text == AppConstant.phoneLoginValue) else {
            callAlert()
            return false
        }
        
        return true
    }
    
    private func callAlert() {
        let alert = UIAlertController(title: "Credentials incorrect", message: "Please check your login/password and try again", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) {_ in
            print("Ok clicked")
        }
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
    
}

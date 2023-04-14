//
//  ViewController.swift
//  Navigation
//
//  Created by Roman Romanov on 03.02.2023.
//

import UIKit

final class FeedViewController: UIViewController {
    
    private var feedModel = FeedModel()
    
    lazy private var stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 10
        
        return $0
    }(UIStackView())
    
    private let numberOneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Button #1", for: .normal)
        button.backgroundColor = .systemBlue
        
        button.layer.cornerRadius = 10
        
        button.layer.shadowOffset = .init(width: 7, height: 7)
        button.layer.shadowRadius = 7
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7

        return button
    }()
    
    private let numberTwoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Button #2", for: .normal)
        button.backgroundColor = .systemBlue
        
        button.layer.cornerRadius = 10
        
        button.layer.shadowOffset = .init(width: 7, height: 7)
        button.layer.shadowRadius = 7
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7

        return button
    }()
    
    private lazy var checkGuessButton: UIButton = {
        let button = CustomButton(title: "check Guess", titleColor: .white)
        
        button.backgroundColor = .systemBlue
        
        button.layer.cornerRadius = 10
        
        button.layer.shadowOffset = .init(width: 7, height: 7)
        button.layer.shadowRadius = 7
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        
        button.buttonAction = {
            print("Кастомная кнопка нажата")
            if self.checkGuessTextField.text!.isEmpty {
                self.checkGuessLabel.backgroundColor = .yellow
                self.checkGuessTextField.shake()
                return
            }
            
            var message = "Word mismatch!"
            var color: UIColor = .red
            
            if (self.feedModel.check(word: self.checkGuessTextField.text!)) {
                message = "Word matched!"
                color = .green
            }
            
            self.checkGuessLabel.backgroundColor = color
            let alert = UIAlertController(title: "Your guess", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        return button.autoLayout()
    }()
    
    private lazy var checkGuessTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Gess"
        
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 2
        
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.clipsToBounds = true
        
        return textField.autoLayout()
    }()
    
    private lazy var checkGuessLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .yellow
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true
        
        return label.autoLayout()
    }()

    private let postButton: UIButton = {
        let button = UIButton()
        button.setTitle("Посмотри меня", for: .normal)
        button.setTitle("Узнай новость!", for: .highlighted)
        button.backgroundColor = .black

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
//        navigationItem.title = "Feed"
        layout()
    }
    
    private func layout() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(numberOneButton)
        stackView.addArrangedSubview(numberTwoButton)
        
        stackView.addArrangedSubview(checkGuessLabel)
        stackView.addArrangedSubview(checkGuessTextField)
        stackView.addArrangedSubview(checkGuessButton)
        
        numberOneButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        numberTwoButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 210),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0),
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }

    private func setupButton() {
        view.addSubview(postButton)
        postButton.center = view.center
        postButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
    }

    @objc private func tapAction() {
        let post = Post(title: "Breaking news")
        let postVC = PostViewController(post: post)
//        present(postVC, animated: true)
        navigationController?.pushViewController(postVC, animated: true)
    }


}


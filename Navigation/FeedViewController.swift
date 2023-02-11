//
//  ViewController.swift
//  Navigation
//
//  Created by Roman Romanov on 03.02.2023.
//

import UIKit

struct Post {
    var title: String
}

final class FeedViewController: UIViewController {
    
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
        navigationItem.title = "Feed"
//        setupButton()
        layout()
    }
    
    private func layout() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(numberOneButton)
        stackView.addArrangedSubview(numberTwoButton)
        
        numberOneButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        numberTwoButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 110),
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


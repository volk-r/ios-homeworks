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

    private let postButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Посмотри меня", for: .normal)
        button.setTitle("Узнай новость!", for: .highlighted)
        button.backgroundColor = .black

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        setupButton()
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


//
//  PostViewController.swift
//  Navigation
//
//  Created by Roman Romanov on 03.02.2023.
//

import UIKit

final class PostViewController: UIViewController {

    init(post: Post? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.title = post?.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        openPostButton()
    }

    private func openPostButton() {
        let barItem = UIBarButtonItem(title: "Открой меня!", style: .done, target: self, action: #selector(barItemAction))
        navigationItem.rightBarButtonItem = barItem
    }

    @objc private func barItemAction () {
        let infoVC = InfoViewController()
        present(infoVC, animated: true)
    }
}

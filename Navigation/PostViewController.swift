//
//  PostViewController.swift
//  Navigation
//
//  Created by Roman Romanov on 03.02.2023.
//

import UIKit

class PostViewController: UIViewController {

    init(post: Post? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.title = post?.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.title = "Breaking news"
        view.backgroundColor = .white
    }
}

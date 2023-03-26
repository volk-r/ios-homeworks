//
//  PostDetailsViewController.swift
//  Navigation
//
//  Created by Roman Romanov on 16.03.2023.
//

import UIKit

final class PostDetailsViewController: UIViewController {
    
    init(model: PostModel) {
        super.init(nibName: nil, bundle: nil)
        view = PostDetaisView(model: model)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

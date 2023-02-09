//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Roman Romanov on 09.02.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private let nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 165, y: 80, width: 300, height: 40))
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "Junior iOS developer"
        
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 165, y: 120, width: 300, height: 40))
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "Waiting for something..."
        label.textColor = .gray
        
        return label
    }()
    
    private let avatarImageView: UIImageView = {
        let image = UIImage(named: "avatar")
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 16, y: 80, width: 132, height: 120)
        imageView.layer.cornerRadius = 55
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.clipsToBounds = true

        return imageView
    }()
    
    private let statusButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 16, y: 220, width: 360, height: 40))
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        
        button.layer.cornerRadius = 10
        
        button.layer.shadowOffset = .init(width: 7, height: 7)
        button.layer.shadowRadius = 7
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        
        addSubview(avatarImageView)
        addSubview(nameLabel)
        addSubview(statusLabel)
        
        setupButton()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        addSubview(statusButton)
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        print(statusLabel.text ?? "")
    }
    
}

//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Roman Romanov on 09.02.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    
    private let nameLabel: UILabel = {
        let label = UILabel()
//        let label = UILabel(frame: CGRect(x: 165, y: 80, width: 300, height: 40))
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "Junior iOS developer"
        
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
//        let label = UILabel(frame: CGRect(x: 165, y: 120, width: 300, height: 40))
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "Waiting for something..."
        label.textColor = .gray
        
        return label
    }()
    
    private let avatarImageView: UIImageView = {
        let image = UIImage(named: "avatar")
        let imageView = UIImageView(image: image!)
        
//        imageView.frame = CGRect(x: 16, y: 80, width: 125, height: 125)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.cornerRadius = 61
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()
    
    private let statusButton: UIButton = {
        let button = UIButton()
//        let button = UIButton(frame: CGRect(x: 16, y: 220, width: 360, height: 40))
        button.translatesAutoresizingMaskIntoConstraints = false
        
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
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
//        let textField = UITextField(frame: CGRect(x: 165, y: 165, width: 210, height: 40))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Set new status"
        
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.clipsToBounds = true
        
        return textField
    }()
    
    init() {
        super.init(frame: .zero)
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        setupButton()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text!
    }
    
    private func setupLayout() {
        addSubview(avatarImageView)
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(textField)
        addSubview(statusButton)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 125),
            avatarImageView.heightAnchor.constraint(equalToConstant: 125),
            
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 0),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 27),
            nameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 27),
            statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusLabel.heightAnchor.constraint(equalToConstant: 40),
            
            textField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 2),
            textField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 27),
            textField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 40),
            
            statusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 15),
            statusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func setupButton() {
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        statusLabel.text = statusText
        print(statusLabel.text ?? "")
    }
    
}

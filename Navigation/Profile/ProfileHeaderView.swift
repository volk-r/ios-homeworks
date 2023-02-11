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
        imageView.frame = CGRect(x: 16, y: 80, width: 125, height: 125)
        imageView.layer.cornerRadius = 61
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill

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
    
    private lazy var textField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 165, y: 165, width: 210, height: 40))
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
        
        addSubview(avatarImageView)
        addSubview(nameLabel)
        addSubview(statusLabel)
        
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        addSubview(textField)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text!
    }
    
    private func setupButton() {
        addSubview(statusButton)
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        statusLabel.text = statusText
        print(statusLabel.text ?? "")
    }
    
}

//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Roman Romanov on 09.02.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    
    private var avatarImageViewTopConstraint = NSLayoutConstraint()
    private var avatarImageViewLeadingConstraint = NSLayoutConstraint()
    private var avatarImageViewWidthConstraint = NSLayoutConstraint()
    private var avatarImageViewHeightConstraint = NSLayoutConstraint()
    
    private var isAvatarOpened: Bool = false
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "Junior iOS developer"
        
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "Waiting for something..."
        label.textColor = .gray
        
        return label
    }()
    
    let avatarImageView: UIImageView = {
        let image = UIImage(named: "avatar")
        let imageView = UIImageView(image: image!)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.cornerRadius = 61
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        imageView.isUserInteractionEnabled = true

        return imageView
    }()
    
    private let statusButton: UIButton = {
        let button = UIButton()
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
        backgroundColor = .systemGray4
        
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        setupButton()
        setupLayout()
        
        setupGesture()
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
        
        avatarImageViewTopConstraint = avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10)
        avatarImageViewLeadingConstraint = avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16)
        avatarImageViewWidthConstraint = avatarImageView.widthAnchor.constraint(equalToConstant: 125)
        avatarImageViewHeightConstraint = avatarImageView.heightAnchor.constraint(equalToConstant: 125)
        
        NSLayoutConstraint.activate([
            avatarImageViewTopConstraint,
            avatarImageViewLeadingConstraint,
            avatarImageViewWidthConstraint,
            avatarImageViewHeightConstraint,
            
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
            statusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }
    
    private func setupButton() {
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        statusLabel.text = statusText
        print(statusLabel.text ?? "")
        textField.text?.removeAll()
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(avatarTapAction))
        avatarImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func avatarTapAction() {
        if (isAvatarOpened == true) {
            print("avatar shown")
            return
        }
        
        print("show avatar")
        isAvatarOpened = true
        
        if let keyWindow = self.superview {
            let whiteBackgroundView = BackdropView(frame: keyWindow.frame)
            
            let closeButton: UIButton = {
                let button = UIButton()
                button.translatesAutoresizingMaskIntoConstraints = false
                let image = UIImage(systemName: "xmark.circle")
                button.setBackgroundImage(image, for: .normal)
                button.tintColor = .black
                
                return button
            }()

            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                keyWindow.addSubview(whiteBackgroundView)
                keyWindow.addSubview(self.avatarImageView)
                keyWindow.addSubview(closeButton)
                
                NSLayoutConstraint.activate([
                    closeButton.topAnchor.constraint(equalTo: whiteBackgroundView.safeAreaLayoutGuide.topAnchor, constant: 10),
                    closeButton.heightAnchor.constraint(equalToConstant: 40),
                    closeButton.widthAnchor.constraint(equalToConstant: 40),
                    closeButton.trailingAnchor.constraint(equalTo: whiteBackgroundView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                    closeButton.bottomAnchor.constraint(equalTo: whiteBackgroundView.safeAreaLayoutGuide.bottomAnchor),
                ])

                self.avatarImageViewLeadingConstraint = keyWindow.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor)
                self.avatarImageView.center = keyWindow.center
                
                self.avatarImageViewWidthConstraint.constant = keyWindow.frame.width
                self.avatarImageViewHeightConstraint.constant = keyWindow.frame.width
                
                self.avatarImageView.layoutIfNeeded()
            }, completion: { _ in
                UIView.animate(withDuration: 0.3) {
                    self.avatarImageView.layer.cornerRadius = 0
                }
            })
        }
    }
}

final class BackdropView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        make()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func make() {
        backgroundColor = .white
        alpha = 0.6
    }

}

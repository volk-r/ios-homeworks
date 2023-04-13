//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Roman Romanov on 09.02.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    
    private var avatarImageViewCenter: CGPoint = CGPoint(x: 0.0, y: 0.0)
    private var isAvatarOpened: Bool = false
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "Junior iOS developer"
        
        return label.autoLayout()
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "Waiting for something..."
        label.textColor = .gray
        
        return label.autoLayout()
    }()
    
    let avatarImageView: UIImageView = {
        let image = UIImage(named: "avatar")
        let imageView = UIImageView(image: image!)
        
        imageView.layer.cornerRadius = 61
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        imageView.isUserInteractionEnabled = true

        return imageView.autoLayout()
    }()
    
    let avatarImageViewForAnimation: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .white
        view.alpha = 0.0
        return view.autoLayout()
    }()
    
    private lazy var closeAvatarButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "xmark.circle.fill")
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.alpha = 0.0
        button.addTarget(self, action: #selector(closeAvatar), for: .touchUpInside)
        
        return button.autoLayout()
    }()
    
    private lazy var statusButton: UIButton = {
        let button = CustomButton(title: "Show status", titleColor: .white)
        
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        
        button.layer.shadowOffset = .init(width: 7, height: 7)
        button.layer.shadowRadius = 7
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        
        button.buttonAction = {
            print("Кастомная кнопка нажата")
            if self.textField.text!.isEmpty {
                self.textField.shake()
                return
            }
            
            print(self.statusLabel.text!)
            self.statusLabel.text = self.statusText
            self.textField.text?.removeAll()
        }
        
        return button.autoLayout()
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Set new status"
        
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.clipsToBounds = true
        
        return textField.autoLayout()
    }()
    
    init() {
        super.init(frame: .zero)
        #if DEBUG
        backgroundColor = .green
        #else
        backgroundColor = .systemGray4
        #endif
        
        textField.addTarget(self, action: #selector(editing), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        setupLayout()
        
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        setTextFieldDefaultBorder()
        statusText = textField.text!
    }
    
    @objc func editing() {
        setTextFieldDefaultBorder()
    }
    
    private func setTextFieldDefaultBorder() {
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
    }
    
    private func setupLayout() {
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(textField)
        addSubview(statusButton)
        
        addSubview(avatarImageViewForAnimation)
        addSubview(avatarImageView)
        addSubview(closeAvatarButton)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: Metric.avatarImageViewWidthAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: Metric.avatarImageViewWidthAnchor),
            
            closeAvatarButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            closeAvatarButton.heightAnchor.constraint(equalToConstant: 40),
            closeAvatarButton.widthAnchor.constraint(equalToConstant: 40),
            closeAvatarButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -5),
            
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
            
            avatarImageViewForAnimation.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            avatarImageViewForAnimation.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            avatarImageViewForAnimation.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
//            avatarImageViewForAnimation.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            avatarImageViewForAnimation.heightAnchor.constraint(equalToConstant: 1000),
        ])
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(avatarTapAction))
        avatarImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func closeAvatar() {
        print("close Avatar")
        isAvatarOpened = false
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut) {
            self.avatarImageView.layer.cornerRadius = Metric.avatarImageViewWCornerRadius
            self.closeAvatarButton.alpha = 0.0
            self.avatarImageView.layer.borderWidth = Metric.avatarImageViewWBorder
            
            self.avatarImageView.center = self.avatarImageViewCenter
            // downscale
            self.avatarImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            
            self.avatarImageView.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.avatarImageViewForAnimation.alpha = 0.0
            }
        }
    }
    
    @objc private func avatarTapAction() {
        print("show avatar")
        
        if (isAvatarOpened == true) {
            print("avatar shown")
            return
        }
        
        isAvatarOpened = true
        
        if let keyWindow = self.superview {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut) {
                self.avatarImageViewForAnimation.alpha = 0.7
                self.avatarImageView.layer.cornerRadius = 0
                self.avatarImageView.layer.borderWidth = 0

                self.avatarImageViewCenter = self.avatarImageView.center
                self.avatarImageView.center = CGPoint(x: keyWindow.center.x, y: keyWindow.center.y - 45)
                // upscale
                self.avatarImageView.transform = CGAffineTransform(scaleX: 3.1, y: 3.1)
                
                self.avatarImageView.layoutIfNeeded()
            } completion: { _ in
                UIView.animate(withDuration: 0.3) {
                    self.closeAvatarButton.alpha = 1
                }
            }
        }
    }
    
    func setupUser(_ user: User?) {
        guard user != nil else { return }
        
        self.avatarImageView.image = user?.getAvatar()
        self.nameLabel.text = user?.getName()
        self.statusLabel.text = user?.getStatus()
    }
}

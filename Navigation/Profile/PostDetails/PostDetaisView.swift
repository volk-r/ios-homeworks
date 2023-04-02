//
//  PostView.swift
//  Navigation
//
//  Created by Roman Romanov on 16.03.2023.
//

import UIKit
import StorageService

final class PostDetaisView: UIView {

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        return contentView
    }()
    
    private let postImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        return imageView
    }()
    
    private let authorLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    private let likeLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private let viewLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.isUserInteractionEnabled = true
        return label
    }()
    
    init(model: PostModel) {
        super.init(frame: .zero)
        backgroundColor = .white
        
        authorLabel.text = model.author
        postImageView.image = UIImage(named: model.image)!
        descriptionLabel.text = model.description
        likeLabel.text = "Likes: \(model.likes)"
        viewLabel.text = "Views: \(model.views)"
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [
            authorLabel,
            postImageView,
            descriptionLabel,
            likeLabel,
            viewLabel
        ].forEach{ contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Metric.labelInset),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.labelInset),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metric.labelInset),
            
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: Metric.labelInset),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: Metric.labelInset),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.labelInset),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metric.labelInset),
            
            likeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Metric.labelInset),
            likeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.labelInset),
            likeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metric.labelInset),
            likeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Metric.labelInset),
            
            viewLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Metric.labelInset),
            viewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metric.labelInset),
            viewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Metric.labelInset),
        ])
    }

}

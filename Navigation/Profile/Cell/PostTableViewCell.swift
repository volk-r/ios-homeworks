//
//  CustomCellTableViewCell.swift
//  Navigation
//
//  Created by Roman Romanov on 18.02.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    private let contentCellView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
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
        return label
    }()
    
    private let viewLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        authorLabel.text = ""
        postImageView.image = nil
        descriptionLabel.text = ""
        likeLabel.text = ""
        viewLabel.text = ""
    }
    
    func setupCell(model: PostModel) {
        authorLabel.text = model.author
        postImageView.image = UIImage(named: model.image)!
        descriptionLabel.text = model.description
        likeLabel.text = "Likes: \(model.likes)"
        viewLabel.text = "Views: \(model.views)"
    }
    
    private func layout() {
        [
            contentCellView,
            authorLabel,
            postImageView,
            descriptionLabel,
            likeLabel,
            viewLabel
        ].forEach{ contentView.addSubview($0) }
        
        let labelInset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            contentCellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            authorLabel.topAnchor.constraint(equalTo: contentCellView.topAnchor, constant: labelInset),
            authorLabel.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: labelInset),
            authorLabel.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor, constant: -labelInset),
            
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: labelInset),
            postImageView.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: labelInset),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: labelInset),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor, constant: -labelInset),
            
            likeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: labelInset),
            likeLabel.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: labelInset),
            likeLabel.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor, constant: -labelInset),
            likeLabel.bottomAnchor.constraint(equalTo: contentCellView.bottomAnchor, constant: -labelInset),
            
            viewLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: labelInset),
            viewLabel.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor, constant: -labelInset),
            viewLabel.bottomAnchor.constraint(equalTo: contentCellView.bottomAnchor, constant: -labelInset),
        ])
    }

}

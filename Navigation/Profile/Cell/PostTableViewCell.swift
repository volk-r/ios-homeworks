//
//  CustomCellTableViewCell.swift
//  Navigation
//
//  Created by Roman Romanov on 18.02.2023.
//

import UIKit
import StorageService

protocol PostTableViewCellDelegate: AnyObject {
    func doLike(indexPath: IndexPath)
    func openPostDetails(indexPath: IndexPath)
}

final class PostTableViewCell: UITableViewCell {
    
    weak var postTableViewCellDelegate: PostTableViewCellDelegate?
    
    private var indexPathCell = IndexPath()

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
        imageView.isUserInteractionEnabled = true
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
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        addGesture()
    }
    
    func setIndexPath(_ indexPath: IndexPath) {
        indexPathCell = indexPath
    }
    
    private func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(likePressed))
        likeLabel.addGestureRecognizer(tapGesture)
        
        let postImageViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(postDetailsOpened))
        postImageView.addGestureRecognizer(postImageViewTapGesture)
    }
    
    @objc private func likePressed() {
        postTableViewCellDelegate?.doLike(indexPath: indexPathCell)
    }
    
    @objc private func postDetailsOpened() {
        postTableViewCellDelegate?.openPostDetails(indexPath: indexPathCell)
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
        
        NSLayoutConstraint.activate([
            contentCellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            authorLabel.topAnchor.constraint(equalTo: contentCellView.topAnchor, constant: Metric.labelInset),
            authorLabel.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: Metric.labelInset),
            authorLabel.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor, constant: -Metric.labelInset),
            
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: Metric.labelInset),
            postImageView.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: Metric.labelInset),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: Metric.labelInset),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor, constant: -Metric.labelInset),
            
            likeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Metric.labelInset),
            likeLabel.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: Metric.labelInset),
            likeLabel.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor, constant: -Metric.labelInset),
            likeLabel.bottomAnchor.constraint(equalTo: contentCellView.bottomAnchor, constant: -Metric.labelInset),
            
            viewLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Metric.labelInset),
            viewLabel.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor, constant: -Metric.labelInset),
            viewLabel.bottomAnchor.constraint(equalTo: contentCellView.bottomAnchor, constant: -Metric.labelInset),
        ])
    }

}

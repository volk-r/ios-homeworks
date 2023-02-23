//
//  PostGalleryTableViewCell.swift
//  Navigation
//
//  Created by Roman Romanov on 23.02.2023.
//

import UIKit

final class PhotosTableViewCell: UITableViewCell {
    
    private var navController: UINavigationController?
    
    // MARK: - need to change color to white

    private let contentCellView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    private let cellHeaderLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.text = "Photos"
        
        return label
    }()
    
    private let galleryButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "arrow.forward")
        button.setBackgroundImage(image, for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
    // MARK: - images
    //    private let postImageView: UIImageView = {
    //        var imageView = UIImageView()
    //        imageView.translatesAutoresizingMaskIntoConstraints = false
    //        imageView.contentMode = .scaleAspectFit
    //        imageView.backgroundColor = .black
    //        return imageView
    //    }()
    
    // MARK: - layout
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        
        galleryButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellHeaderLabel.text = ""
    }
    
    func setupCell(navigationController: UINavigationController?) {
        navController = navigationController
    }
    
    private func layout() {
        [
            contentCellView,
            cellHeaderLabel,
            galleryButton,
//            postImageView,
        ].forEach{ contentView.addSubview($0) }
        
        let labelInset: CGFloat = 12
        
        NSLayoutConstraint.activate([
            contentCellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            cellHeaderLabel.topAnchor.constraint(equalTo: contentCellView.topAnchor, constant: labelInset),
            cellHeaderLabel.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: labelInset),
            
            galleryButton.topAnchor.constraint(equalTo: contentCellView.topAnchor, constant: labelInset),
            galleryButton.leadingAnchor.constraint(equalTo: cellHeaderLabel.trailingAnchor, constant: labelInset),
            galleryButton.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor, constant: -labelInset),
            galleryButton.centerYAnchor.constraint(equalTo: cellHeaderLabel.centerYAnchor),
//            cellHeaderLabel.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
//            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: labelInset),
//            postImageView.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor),
//            postImageView.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor),
//            postImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
//            postImageView.bottomAnchor.constraint(equalTo: contentCellView.bottomAnchor, constant: -labelInset),
        ])
    }
    
    // MARK: - actions
    
    @objc private func tapAction() {
        let photoVC = PhotosViewController()
        navController?.pushViewController(photoVC, animated: true)
    }

}

//
//  PhotoCollectionViewCell.swift
//  Navigation
//
//  Created by Roman Romanov on 23.02.2023.
//

import UIKit

protocol PhotoCollectionViewCellDelegate: AnyObject {
    func didTapImageInCell(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath)
}

final class PhotoCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: PhotoCollectionViewCellDelegate?
    
    private var indexPathCell = IndexPath()
    
    var cellImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        return imageView.autoLayout()
    }()
    
    lazy var openGalleryButton: UIButton = {
        let button = UIButton(frame: contentView.bounds)
        button.setTitle("See\nmore", for: .normal)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 6

        return button.autoLayout()
    }()
    
    func setIndexPath(_ indexPath: IndexPath) {
        indexPathCell = indexPath
    }
    
    func setupCell(imageName: String) {
        cellImageView.image = UIImage(named: imageName)!
        layout()
        addGesture()
    }
    
    private func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        cellImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapAction() {
        delegate?.didTapImageInCell(cellImageView.image, frameImage: cellImageView.frame, indexPath: indexPathCell)
    }
    
    func setupHorizontalCell(imageName: String) {
        cellImageView.image = UIImage(named: imageName)!
        cellImageView.layer.cornerRadius = 6
        cellImageView.clipsToBounds = true
        
        layout()
    }
    
    func setupButtonCell() {
        contentView.addSubview(openGalleryButton)
        
        NSLayoutConstraint.activate([
            openGalleryButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            openGalleryButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            openGalleryButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            openGalleryButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            openGalleryButton.heightAnchor.constraint(greaterThanOrEqualToConstant: contentView.bounds.height)
        ])
    }
    
    func layout() {
        contentView.addSubview(cellImageView)
        
        NSLayoutConstraint.activate([
            cellImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

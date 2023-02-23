//
//  PhotoCollectionViewCell.swift
//  Navigation
//
//  Created by Roman Romanov on 23.02.2023.
//

import UIKit

final class PhotoCollectionViewCell: UICollectionViewCell {
    
    var cellImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    func setupCell(imageName: String) {
        cellImageView.image = UIImage(named: imageName)!
        layout()
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

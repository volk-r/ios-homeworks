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
    
    let cellHeaderLabel: UILabel = {
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
    
    private lazy var horizontalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    // MARK: - layout
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        setupCollectionView()
        
        galleryButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        horizontalCollectionView.dataSource = self
        horizontalCollectionView.delegate = self
    }
    
    func setupCell(navigationController: UINavigationController?) {
        navController = navigationController
    }
    
    private func layout() {
        [
            contentCellView,
            cellHeaderLabel,
            galleryButton,
            horizontalCollectionView,
        ].forEach{ contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            contentCellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            cellHeaderLabel.topAnchor.constraint(equalTo: contentCellView.topAnchor, constant: Metric.labelInset),
            cellHeaderLabel.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: Metric.labelInset),
            
            galleryButton.topAnchor.constraint(equalTo: contentCellView.topAnchor, constant: Metric.labelInset),
            galleryButton.leadingAnchor.constraint(equalTo: cellHeaderLabel.trailingAnchor, constant: Metric.labelInset),
            galleryButton.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor, constant: -Metric.labelInset),
            galleryButton.centerYAnchor.constraint(equalTo: cellHeaderLabel.centerYAnchor),
//            galleryButton.bottomAnchor.constraint(equalTo: contentCellView.bottomAnchor),
//            cellHeaderLabel.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            horizontalCollectionView.topAnchor.constraint(equalTo: cellHeaderLabel.bottomAnchor, constant: Metric.labelInset),
            horizontalCollectionView.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: 8),
            horizontalCollectionView.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor, constant: -8),
            horizontalCollectionView.bottomAnchor.constraint(equalTo: contentCellView.bottomAnchor),
            horizontalCollectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100)
        ])
    }
    
    // MARK: - actions
    
    @objc private func tapAction() {
        let photoVC = PhotosViewController()
        navController?.pushViewController(photoVC, animated: true)
    }

}

extension PhotosTableViewCell: UICollectionViewDataSource {
    private var maxHorizontalGalleryImages: Int { return 7 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        maxHorizontalGalleryImages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.item == maxHorizontalGalleryImages - 1) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
            cell.setupButtonCell()
            cell.openGalleryButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        cell.setupHorizontalCell(imageName: galleryImages[indexPath.item])
        
        return cell
    }
    
}

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    private var sideInset: CGFloat { return 8 }
    private var elementCount: CGFloat { return 4 }
    private var insetCount: CGFloat { return elementCount + 1 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - sideInset * insetCount) / elementCount
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: 0, bottom: sideInset, right: 0)
    }
}

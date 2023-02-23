//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Roman Romanov on 23.02.2023.
//

import UIKit

final class PhotosViewController: UIViewController {
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGray4
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        
        return collectionView
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Photo Gallery"
        view.backgroundColor = .white
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func layout() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        galleryImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        cell.setupCell(imageName: galleryImages[indexPath.item])
        
        return cell
    }
    
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var sideInset: CGFloat { return 8 }
    private var elementCount: CGFloat { return 3 }
    private var insetCount: CGFloat { return elementCount + 1 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - sideInset * insetCount) / elementCount
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }
}

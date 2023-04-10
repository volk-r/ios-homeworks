//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Roman Romanov on 23.02.2023.
//

import UIKit
import iOSIntPackage

final class PhotosViewController: UIViewController {
    
    private lazy var verticalCollectionView: UICollectionView = makeCollectionView(scrolllDirection: .vertical)
    
    private var photoCollectionViewCell =  PhotoCollectionViewCell()
    private var initialImageRect: CGRect = .zero
    
    private var publisher: ImagePublisherFacade? {
        didSet {
            // TODO: - 
//            publisher?.subscribe(<#T##subscriber: ImageLibrarySubscriber##ImageLibrarySubscriber#>)
        }
    }
    
    private let whiteView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .white
        view.alpha = 0.7
        return view
    }()
    
    private lazy var crossButton: UIButton = {

        let button = UIButton()
        let image = UIImage(systemName: "xmark.circle.fill")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        button.addTarget(self, action: #selector(crossButtonAction), for: .touchUpInside)
        
        return button
    }()
    
    private let animatingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
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
        
        let facade = ImagePublisherFacade()
        publisher = facade
    }
    
    @objc private func crossButtonAction() {
        crossButton.removeFromSuperview()
        whiteView.removeFromSuperview()
        animateImageToInitial(rect: initialImageRect)
    }
    
    private func setupCollectionView() {
        verticalCollectionView.dataSource = self
        verticalCollectionView.delegate = self
    }
    
    private func layout() {
        view.addSubview(verticalCollectionView)
        
        NSLayoutConstraint.activate([
            verticalCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            verticalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            verticalCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            verticalCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func animateImageToInitial(rect: CGRect) {
        UIView.animate(withDuration: 0.6) {
            self.animatingImageView.frame = rect
            self.animatingImageView.layer.cornerRadius = 0
        } completion: { _ in
            self.animatingImageView.removeFromSuperview()
        }
    }
    
    private func animateImage(_ image: UIImage?, imageFrame: CGRect) {
        view.addSubview(whiteView)
        view.addSubview(crossButton)
        view.addSubview(animatingImageView)
        
        NSLayoutConstraint.activate([
            crossButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            crossButton.heightAnchor.constraint(equalToConstant: 40),
            crossButton.widthAnchor.constraint(equalToConstant: 40),
            crossButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
        ])
        
        animatingImageView.image = image
        animatingImageView.alpha = 1.0
        animatingImageView.frame = CGRect(x: imageFrame.origin.x,
                                          y: imageFrame.origin.y,
                                          width: imageFrame.width,
                                          height: imageFrame.height)
        
        UIView.animate(withDuration: 0.6) {
            self.animatingImageView.frame.size = CGSize(width: UIScreen.main.bounds.width,
                                                        height: UIScreen.main.bounds.width)
            self.animatingImageView.center = self.view.center
            self.animatingImageView.layer.cornerRadius = UIScreen.main.bounds.width / 2
        }
    }

}

extension PhotosViewController: ImageLibrarySubscriber {
    func receive(images: [UIImage]) {
        // TODO: -
        publisher?.addImagesWithTimer(time: 0.5, repeat: 20)
    }
    
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        galleryImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        cell.setupCell(imageName: galleryImages[indexPath.item])
        cell.delegate = self
        cell.setIndexPath(indexPath)
        
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

extension PhotosViewController: PhotoCollectionViewCellDelegate {
    func didTapImageInCell(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath) {
        print(indexPath)
        let rectCell = verticalCollectionView.cellForItem(at: indexPath)?.frame ?? .zero
        let rectInSuperView = verticalCollectionView.convert(rectCell, to: verticalCollectionView.superview)
        initialImageRect = CGRect(x: rectCell.origin.x,
                                  y: frameImage.origin.y + rectInSuperView.origin.y,
                                  width: frameImage.width,
                                  height: frameImage.height)
        
        animateImage(image, imageFrame: initialImageRect)
    }
}

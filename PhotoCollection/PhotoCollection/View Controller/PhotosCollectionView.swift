//
//  PhotosCollectionView.swift
//  PhotoCollection
//
//  Created by Kerby Jean on 1/30/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionView: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var controller = PhotoController()
    var themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        let themeButton = UIBarButtonItem(title: "Theme", style: .plain, target: self, action: #selector(selectTheme))
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPhoto))
        
        navigationItem.leftBarButtonItem = themeButton
        navigationItem.rightBarButtonItem = addButton
        
        collectionView.delegate = self

        self.collectionView!.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.id)
        
        setTheme()
    }
    
    
    // MARK: - Functions
    
    func setTheme() {
        if let theme = themeHelper.themePreference {
            if theme == "Dark" {
                collectionView.backgroundColor = .darkGray
            } else {
                collectionView.backgroundColor = .light
            }
        }
    }
    
    @objc func selectTheme() {
        let vc = UINavigationController(rootViewController: ThemeSelectionViewController())
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func addPhoto() {
        navigationController?.pushViewController(AddPhotoVC(), animated: true)
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return controller.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.id, for: indexPath) as! PhotoCell
        cell.backgroundColor = .red
        let photo = controller.photos[indexPath.row]
        cell.configure(photo)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! PhotoCell
        let vc = 
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = CGSize(width: 60, height: 60)
        return cellSize
    }
}


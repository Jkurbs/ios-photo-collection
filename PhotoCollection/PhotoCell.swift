//
//  PhotoCell.swift
//  PhotoCollection
//
//  Created by Kerby Jean on 1/30/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    var imageView = UIImageView()
    var titleLabel = UILabel()
    
    static var id: String {
        return String(describing: self)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
    }
    
    func configure(_ photo: Photo) {
        imageView.image = photo.image
        titleLabel.text = photo.title
    }
}

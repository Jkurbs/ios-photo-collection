//
//  Photo.swift
//  PhotoCollection
//
//  Created by Kerby Jean on 1/30/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class Photo {
    
    var image: UIImage
    var title: String
    
    init(image: UIImage, title: String) {
        self.image = image
        self.title = title
    }
}

extension Photo: Equatable {
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.title != rhs.title
    }
}

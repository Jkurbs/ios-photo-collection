//
//  AddPhotoVC.swift
//  PhotoCollection
//
//  Created by Kerby Jean on 1/30/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class AddPhotoVC: UIViewController {
    
    
    // MARK: - UI Elements
    
    var imageView = UIImageView()
    var imagePicker = UIImagePickerController()
    var addButton = UIButton()
    
    // MARK: View Controller LifeCicle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    // MARK: - Functions
    
    func setupViews() {
        
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .red
        
        let width = view.frame.width - 200
        imageView.frame = CGRect(x: 0, y: 100, width: width, height: width)
        imageView.center.x = view.center.x
        imageView.layer.cornerRadius = imageView.frame.width/2
        
        view.addSubview(addButton)
        
        addButton.setTitle("Add Photo", for: .normal)
        addButton.frame = CGRect(x: 0, y:  width + 100, width: width, height: 45)
        addButton.center.x = view.center.x
        addButton.setTitleColor(view.tintColor, for: .normal)
        addButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
    }
}

extension AddPhotoVC: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @objc func addImage() {
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if  let image = info[.originalImage] as? UIImage {
            self.imageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

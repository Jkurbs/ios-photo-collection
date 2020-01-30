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
    var textField = UITextField()
    
    // MARK: View Controller LifeCicle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: - Functions
    
    func setupViews() {
        
        view.backgroundColor = .white
        
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(add))
        
        navigationItem.rightBarButtonItem = saveButton
        
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        
        let width = view.frame.width - 250
        let centerX = view.center.x
        
        
        imageView.frame = CGRect(x: 0, y: 100, width: width, height: width)
        imageView.center.x = centerX
        imageView.layer.cornerRadius = imageView.frame.width/2
        
        imageView.layer.borderWidth = 8.0
        imageView.layer.borderColor = UIColor(white: 0.8, alpha: 1.0).cgColor
        
        view.addSubview(addButton)
        
        addButton.setTitle("Add Photo", for: .normal)
        addButton.frame = CGRect(x: 0, y:  width + 100, width: width, height: 45)
        addButton.center.x = centerX
        addButton.setTitleColor(view.tintColor, for: .normal)
        addButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        
        view.addSubview(textField)
        textField.placeholder = "Add name"
        textField.textAlignment = .center
        textField.frame = CGRect(x: 0, y: addButton.layer.position.y + 20, width: width, height: 60)
        textField.center.x = centerX
        textField.becomeFirstResponder()
    }
    
    
    @objc func add() {
        
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

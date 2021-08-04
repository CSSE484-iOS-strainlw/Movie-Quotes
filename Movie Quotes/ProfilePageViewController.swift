//
//  ProfilePageViewController.swift
//  Movie Quotes
//
//  Created by Loki Strain on 8/3/21.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class ProfilePageViewController: UIViewController{
    
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var displayNameTextField: UITextField!
    @IBAction func pressedEditPhoto(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            print("Phone")
            imagePickerController.sourceType = .camera
        }else{
            print("Sim")
            imagePickerController.sourceType = .photoLibrary
        }
        
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        
        
        
        displayNameTextField.addTarget(self, action: #selector(handleNameEdit), for: UIControl.Event.editingChanged)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UserManager.shared.beginListening(uid: Auth.auth().currentUser!.uid, changeListener: updateView)    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UserManager.shared.stopListeing()
        
    }
    
    @objc func handleNameEdit(_sender: Any){
        if let name = displayNameTextField.text{
            print(name)
            UserManager.shared.updateName(name: name)
        }
    }
    
    func updateView(){
        displayNameTextField.text = UserManager.shared.name
        
        if UserManager.shared.photoUrl.count > 0{
            ImageUtils.load(imageView: profilePhotoImageView, from: UserManager.shared.photoUrl)
        }
        
    }
    
}

extension ProfilePageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage? {
            profilePhotoImageView.image = image
        } else if let image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage? {
            profilePhotoImageView.image = image        }
        
        
        dismiss(animated: true, completion: nil)
    }

}



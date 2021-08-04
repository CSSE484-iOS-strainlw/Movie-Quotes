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

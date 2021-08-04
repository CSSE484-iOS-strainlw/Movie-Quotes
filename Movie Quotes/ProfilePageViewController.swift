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
        
        UserManager.shared.beginListening(uid: Auth.auth().currentUser!.uid, changeListener: updateView)
        
        displayNameTextField.addTarget(self, action: #selector(handleNameEdit), for: UIControl.Event.editingChanged)
        
        
    }
    
    @objc func handleNameEdit(_sender: Any){
        if let name = displayNameTextField.text{
            print(name)
            UserManager.shared.updateName(name: name)
        }
    }
    
    func updateView(){
        displayNameTextField.text = UserManager.shared.name
        
    }
    
}

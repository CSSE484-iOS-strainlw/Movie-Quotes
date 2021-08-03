//
//  LoginViewController.swift
//  Movie Quotes
//
//  Created by Loki Strain on 8/2/21.
//

import Foundation
import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    let showListSegueIdentifier = "ShowListSegue"
    
    @IBAction func pressedSignInNewUser(_ sender: Any) {
    }
    @IBAction func pressedLogInExsistingUser(_ sender: Any) {
    }
    
}

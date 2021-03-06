//
//  LoginViewController.swift
//  Movie Quotes
//
//  Created by Loki Strain on 8/2/21.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    let showListSegueIdentifier = "ShowListSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            print("Already Signed in")
            self.performSegue(withIdentifier: self.showListSegueIdentifier, sender: self)
        }
    }
    
    @IBAction func pressedSignInNewUser(_ sender: Any) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        Auth.auth().createUser(withEmail: email, password: password) {authResult, error in
            if let error = error {
                print("Error Creating New User \(error)")
            }
            
            print("It Worked. New user created and signe in")
            self.performSegue(withIdentifier: self.showListSegueIdentifier, sender: self)
            
        }
    }
    
    @IBAction func pressedLogInExsistingUser(_ sender: Any) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
            if let error = error {
                print("Error With Exsisting user \(error)")
            }
            
            print("It Worked. Signed in exsisting user")
            self.performSegue(withIdentifier: self.showListSegueIdentifier, sender: self)
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showListSegueIdentifier{
            print("Checking for user \(Auth.auth().currentUser!.uid)")
            UserManager.shared.addNewUserMaybe(uid: Auth.auth().currentUser!.uid, name: Auth.auth().currentUser!.displayName, photoUrl: Auth.auth().currentUser!.photoURL?.absoluteString ?? "")
        }
    }
    
    }
    


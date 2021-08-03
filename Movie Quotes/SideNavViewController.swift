//
//  SideNavViewController.swift
//  Movie Quotes
//
//  Created by Loki Strain on 8/2/21.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class SideNavViewController: UIViewController{
    
    
    
    @IBAction func pressedGoToProfilePage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        tableViewController.performSegue(withIdentifier: ProfilePageSegue, sender: tableViewController)
    }
    
    @IBAction func pressedShowAllQuotes(_ sender: Any) {
        
        tableViewController.isShowingAllQuotes = true
        tableViewController.startListening()
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func pressedShowMyQuotes(_ sender: Any) {
        tableViewController.isShowingAllQuotes = false
        tableViewController.startListening()
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func pressedDeleteQuotes(_ sender: Any) {
        tableViewController.setEditing(!tableViewController.isEditing, animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func pressedLogOut(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        do{
            try Auth.auth().signOut()
        } catch{
            print("Sign out Error")
        }
    }
    
    var tableViewController: MovieQuotesTableViewController{
            let navController = presentingViewController as! UINavigationController
            return navController.viewControllers.last as! MovieQuotesTableViewController
    }
    
}

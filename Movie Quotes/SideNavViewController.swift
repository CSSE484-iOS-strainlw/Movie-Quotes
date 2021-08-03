//
//  SideNavViewController.swift
//  Movie Quotes
//
//  Created by Loki Strain on 8/2/21.
//

import Foundation
import UIKit

class SideNavViewController: UIViewController{
    
    
    
    @IBAction func pressedGoToProfilePage(_ sender: Any) {
        print("TODO Make a Profile Page")
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
        print("TODO Go Into Editing Mode")
    }
    
    @IBAction func pressedLogOut(_ sender: Any) {
        print("Sign Out")
    }
    
    var tableViewController: MovieQuotesTableViewController{
            let navController = presentingViewController as! UINavigationController
            return navController.viewControllers.last as! MovieQuotesTableViewController
    }
    
}

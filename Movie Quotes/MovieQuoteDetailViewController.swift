//
//  MovieQuoteDetailViewController.swift
//  Movie Quotes
//
//  Created by Loki Strain on 7/11/21.
//

import Foundation
import UIKit
import Firebase

class MovieQuoteDetailViewController: UIViewController {
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var movieLabel: UILabel!
    
    var movieQuote: MovieQuote?
    var movieQuoteRef: DocumentReference!
    var movieQuoteListener: ListenerRegistration!
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.edit, target: self, action: #selector(showEditDialog))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // updateView()
        movieQuoteListener = movieQuoteRef.addSnapshotListener { (documentSnapshot, error) in
            
            if let error = error {
                print("Error")
                return
            }
            if !documentSnapshot!.exists{
                print("might go back")
                return
            }
            self.movieQuote = MovieQuote(documentSnapshot: documentSnapshot!)
            self.updateView()
            }
        }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        movieQuoteListener.remove()
    }
    
    @objc func showEditDialog(){
        
        
            let alertController = UIAlertController(title: "Edit this movie Quote", message: "", preferredStyle: .alert)
            
            // configure
            alertController.addTextField { (textField) in
                textField.placeholder = "Quote"
                textField.text = self.movieQuote?.quote
            }
            alertController.addTextField { (textField) in
                textField.placeholder = "Movie"
                textField.text = self.movieQuote?.movie
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            let submitAction = UIAlertAction(title: "Submit", style: .default) { (action) in
                print("TODO: Create a movie Quote")
                // Todo: Add a quote
                let quoteTextField = alertController.textFields![0] as UITextField
                let movieTextField = alertController.textFields![1] as UITextField
                //            print(quoteTextField.text!)
                //            print(movieTextField.text!)
//                self.movieQuote?.quote = quoteTextField.text!
//                self.movieQuote?.movie = movieTextField.text!
//                self.updateView()
                
                self.movieQuoteRef.updateData(["quote": quoteTextField.text!,"movie": movieTextField.text!])
                
            }
            alertController.addAction(submitAction)
            
            present(alertController, animated: true, completion: nil)
        
    }
    
    
    
    func updateView() {
        quoteLabel.text = movieQuote?.quote
        movieLabel.text = movieQuote?.movie
    }
}

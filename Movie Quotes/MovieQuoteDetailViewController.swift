//
//  MovieQuoteDetailViewController.swift
//  Movie Quotes
//
//  Created by Loki Strain on 7/11/21.
//

import Foundation
import UIKit

class MovieQuoteDetailViewController: UIViewController {
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var movieLabel: UILabel!
    
    var movieQuote: MovieQuote?
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.edit, target: self, action: #selector(showEditDialog))
        
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
                self.movieQuote?.quote = quoteTextField.text!
                self.movieQuote?.movie = movieTextField.text!
                self.updateView()
                
            }
            alertController.addAction(submitAction)
            
            present(alertController, animated: true, completion: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }
    
    func updateView() {
        quoteLabel.text = movieQuote?.quote
        movieLabel.text = movieQuote?.movie
    }
}

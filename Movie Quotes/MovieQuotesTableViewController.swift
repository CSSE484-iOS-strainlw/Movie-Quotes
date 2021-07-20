//
//  MovieQuotesTableViewController.swift
//  Movie Quotes
//
//  Created by Loki Strain on 7/11/21.
//

import Foundation
import UIKit
import Firebase

class MovieQuotesTableViewController: UITableViewController {
    
    let movieQuoteCellIdentifier = "MovieQuoteCell"
    let detailSegueIdentifier = "DetailSegue"
    var movieQuotesRef: CollectionReference!
    
    // var names = ["Loki","Jade","Larry"]
    var movieQuotes = [MovieQuote]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        // movieQuotes.append(MovieQuote(quote: "I Worked", movie: "Movie 1"))
        // movieQuotes.append(MovieQuote(quote: "I Worked again", movie: "Movie 2"))
        movieQuotesRef = Firestore.firestore().collection("MovieQuotes")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddQuoteDialog))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
        movieQuotesRef.addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot{
                self.movieQuotes.removeAll()
                querySnapshot.documents.forEach { (documentSnapshot) in
                    print(documentSnapshot.documentID)
                    print(documentSnapshot.data())
                    self.movieQuotes.append(MovieQuote(documentSnapshot: documentSnapshot))
                }
                self.tableView.reloadData()
            }else{
                print("Error")
                return
            }
        }
    }
    
    @objc func showAddQuoteDialog(){
        let alertController = UIAlertController(title: "Create a new movie quote", message: "", preferredStyle: .alert)
        
        // configure
        alertController.addTextField { (textField) in
            textField.placeholder = "Quote"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Movie"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let submitAction = UIAlertAction(title: "Create Quote", style: .default) { (action) in
            print("TODO: Create a movie Quote")
            // Todo: Add a quote
            let quoteTextField = alertController.textFields![0] as UITextField
            let movieTextField = alertController.textFields![1] as UITextField
            //            print(quoteTextField.text!)
            //            print(movieTextField.text!)
            let newMovieQuote = MovieQuote(quote: quoteTextField.text!, movie: movieTextField.text!)
            self.movieQuotes.insert(newMovieQuote, at: 0)
            self.tableView.reloadData()
        }
        alertController.addAction(submitAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieQuotes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: movieQuoteCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = movieQuotes[indexPath.row].quote
        cell.detailTextLabel?.text = movieQuotes[indexPath.row].movie
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            movieQuotes.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == detailSegueIdentifier{
            if let indexPath = tableView.indexPathForSelectedRow{
                (segue.destination as! MovieQuoteDetailViewController).movieQuote = movieQuotes[indexPath.row]
            }
        }
    }
}

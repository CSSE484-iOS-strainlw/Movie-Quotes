//
//  MovieQuotesTableViewController.swift
//  Movie Quotes
//
//  Created by Loki Strain on 7/11/21.
//

import Foundation
import UIKit

class MovieQuotesTableViewController: UITableViewController {
    
    let movieQuoteCellIdentifier = "MovieQuoteCell"
    
    // var names = ["Loki","Jade","Larry"]
    var movieQuotes = [MovieQuote]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieQuotes.append(MovieQuote(quote: "I Worked", movie: "Movie 1"))
        movieQuotes.append(MovieQuote(quote: "I Worked again", movie: "Movie 2"))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddQuoteDialog))
        
    }
    
    @objc func showAddQuoteDialog(){
        print("You pressed it")
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
}

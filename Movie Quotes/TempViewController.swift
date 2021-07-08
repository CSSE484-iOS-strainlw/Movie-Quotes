//
//  TempViewController.swift
//  Movie Quotes
//
//  Created by Loki Strain on 7/7/21.
//

import Foundation
import UIKit

class TempViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    let tempCellIdentifier = "TempCell"
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tempCellIdentifier, for: indexPath)
        cell.textLabel?.text = "This is row \(indexPath.row)"
        
        return cell
    }
}

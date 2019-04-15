//
//  CategoryTableViewController.swift
//  DailyChores
//
//  Created by Christian Schmutte on 15.04.19.
//  Copyright © 2019 Christian Schmutte. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    // TODO: Global Dummies for Categories
    let categories = ["Groceries", "Chores", "Important"]

    override func viewDidLoad() {
        super.viewDidLoad()

     
    }

    // TODO: - Table view data source methods


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "categoryCell")
        cell.textLabel?.text = categories[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "categoryToTodo", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoTableViewController

        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.categoryTitle = categories[indexPath.row]
        }

    }

    

    @IBAction func addCategory(_ sender: Any) {
    }
    
}

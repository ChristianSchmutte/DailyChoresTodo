//
//  TodoTableViewController.swift
//  DailyChores
//
//  Created by Christian Schmutte on 15.04.19.
//  Copyright © 2019 Christian Schmutte. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {
    
    // MARK: TODO - Global variables
    var todos = ["Buy Milk", "Walk The Dog", "Call Mom"]
    var selectedCategory: Category? {
        didSet {
            loadTodos()
        }
    }
    var categoryTitle: String?
    
    // MARK: - TODO: ViewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)


        self.title = categoryTitle
        
    }
    
    // MARK: - TODO: TableView Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "todoCell")
        cell.textLabel?.text = todos[indexPath.row]
        
        
        return cell
    }
    
    
    @IBAction func addTodo(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "addToDoSegue", sender: self)
    }
    


}

//
//  CategoryTableViewController.swift
//  DailyChores
//
//  Created by Christian Schmutte on 15.04.19.
//  Copyright © 2019 Christian Schmutte. All rights reserved.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {
    
    // MARK: - TODO:
    /*
     TODOS:
     - make cells swipable:
        - have an edit mode in form of an alarm that cascades down to todos
        - make it so that every thing is deleted then
     - When every todo in a category is checked let it reflect on the category table
        (e.g. change the color or let it have a checkmar itself
     - introduce sections, so on a swipe user can mark important categories/todos
     -
     */
    
    // MARK: - Global Variables
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    // TODO: Global Dummies for Categories
    var dummyCategories = ["Groceries", "Chores", "Important"]
    var categories = [Category]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
        print(dataFilePath)
    }

    // TODO: - Table view data source methods


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "categoryCell")
        cell.textLabel?.text = categories[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "categoryToTodo", sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoTableViewController

        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories[indexPath.row]
        }

    }

    

    @IBAction func addCategory(_ sender: Any) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add Category", message: nil, preferredStyle: .alert)
        alert.addTextField { (alertTextField) in
            textField = alertTextField
        }
        let action = UIAlertAction(title: "Add", style: .default) { (_) in
            
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            
            self.saveCategories()
            
            self.loadCategories()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: CoreData Data Methods
    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        do {
            categories = try context.fetch(request)
        } catch {
            print("Error loading categories, \(error)")
        }
        tableView.reloadData()
    }
    
    func saveCategories(){
        do {
            try context.save()
        } catch {
            print("Error saving categories, \(error)")
        }
    }
    
}



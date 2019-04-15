//
//  TodoTableViewController.swift
//  DailyChores
//
//  Created by Christian Schmutte on 15.04.19.
//  Copyright © 2019 Christian Schmutte. All rights reserved.
//

import UIKit
import CoreData

class TodoTableViewController: UITableViewController, CreateTodo {
    
    // MARK: TODO - Global variables
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var dummyTodos = ["Buy Milk", "Walk The Dog", "Call Mom"]
    var todos = [Todo]()
    var selectedCategory: Category? {
        didSet {
            loadTodos()
            self.title = self.selectedCategory?.name ?? "Gotcha"
        }
    }
    
    
    var categoryTitle: String?
    
    // MARK: - TODO: ViewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)


        
        
    }
    
    // MARK: - TODO: TableView Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "todoCell")
        cell.textLabel?.text = todos[indexPath.row].title
        
        if todos[indexPath.row].done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        todos[indexPath.row].done = !todos[indexPath.row].done
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        tableView.reloadData()
        
    }
    
    
    @IBAction func addTodo(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "addToDoSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! AddTodoViewController
        destinationVC.delegate = self
        
    }
    

    func loadTodos(with request: NSFetchRequest<Todo> = Todo.fetchRequest(), predicate: NSPredicate? = nil){
        
        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
        
        if let additionalPredicate = predicate {
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, additionalPredicate])
        } else {
            request.predicate = categoryPredicate
        }
        
        do {
            todos = try context.fetch(request)
        } catch {
            print("Error loading todos, \(error)")
        }
        
        tableView.reloadData()
    }
    
    func saveTodos(){
        do {
            try context.save()
            tableView.reloadData()
        } catch {
            print("Error saving todo")
        }
        
        loadTodos()
    }
    
    // MARK: - Protocol method
    func createTodo(title: String, done: Bool, repeats: Bool){
        let newTodo = Todo(context: context)
        newTodo.title = title
        newTodo.done = done
        newTodo.repeats = repeats
        newTodo.parentCategory = selectedCategory!
        
        saveTodos()
    }
    
    

}

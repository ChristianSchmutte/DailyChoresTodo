//
//  AddTodoViewController.swift
//  DailyChores
//
//  Created by Christian Schmutte on 15.04.19.
//  Copyright © 2019 Christian Schmutte. All rights reserved.
//

import UIKit
import CoreData

protocol CreateTodo {
    func createTodo(title: String, done: Bool, repeats: Bool)
}

class AddTodoViewController: UIViewController {
    
    // MARK: - Global Variables
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var delegate: TodoTableViewController?

    
    // MARK: - Outlets

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var dailySwitch: UISwitch!
    
    
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()

        
    }
   
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        delegate?.createTodo(title: textField.text!, done: false, repeats: dailySwitch.isOn)
        navigationController?.popViewController(animated: true)
    }
    

}


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

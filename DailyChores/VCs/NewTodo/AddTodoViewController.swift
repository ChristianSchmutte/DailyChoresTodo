//
//  AddTodoViewController.swift
//  DailyChores
//
//  Created by Christian Schmutte on 15.04.19.
//  Copyright © 2019 Christian Schmutte. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController {
    
    // MARK: - Global Variables
    
    // MARK: - Outlets

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var dailySwitch: UISwitch!
    
    
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    


}

extension AddTodoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "addTodoTilteCell")
            
            return cell!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "addTodoDailyCell")
            
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        tableView.frame.size.height = 160
        
        return 80
    }
    
    
    
}

//
//  AddToDoViewController.swift
//  doIT
//
//  Created by Kelly Tu on 6/24/20.
//  Copyright © 2020 julia nellie. All rights reserved.
//

import UIKit
import CoreData

class AddToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()
    
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addedTapped(_ sender: Any) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
         return
        }
        let context = appDelegate.persistentContainer.viewContext
        let toDo = ToDoCD(context: context)
        toDo.name = titleTextField.text
        toDo.important = importantSwitch.isOn
        appDelegate.saveContext()
        navigationController?.popViewController(animated: true)
        
      /*  let toDo = ToDo()
        
        if let titleText = titleTextField.text{
        toDo.name = titleText
        toDo.important = importantSwitch.isOn
    }
    previousVC.toDos.append(toDo)
    previousVC.tableView.reloadData()
    navigationController?.popViewController(animated: true)
        
       */
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

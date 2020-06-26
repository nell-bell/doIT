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
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            let toDo = ToDoCD(entity: ToDoCD.entity(), insertInto: context)
            
            if let titleText = titleTextField.text {
                    // we will take the titleText and assign that value to toDo.name
                    // this .name and .important came from the attributes you typed in on the Core Data page!
                    toDo.name = titleText
                    toDo.important = importantSwitch.isOn
        
                }
                
                try? context.save()
                
                navigationController?.popViewController(animated: true)
            }
    }

        /* guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
         return
        }
        let context = appDelegate.persistentContainer.viewContext
        let toDo = ToDoCD(context: context)
        toDo.name = titleTextField.text
        toDo.important = importantSwitch.isOn
        appDelegate.saveContext()
        navigationController?.popViewController(animated: true)
        
        let toDo = ToDo()
        
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



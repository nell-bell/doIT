//
//  CompleteToDoViewController.swift
//  doIT
//
//  Created by Kelly Tu on 6/25/20.
//  Copyright © 2020 julia nellie. All rights reserved.
//

import UIKit

class CompleteToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()
    var selectedToDo : ToDoCD?
    
    @IBOutlet weak var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = selectedToDo?.name
    }
    
    @IBAction func completedTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                   if let theToDo = selectedToDo {
                       context.delete(theToDo)
                       navigationController?.popViewController(animated: true)
                   }
               }
        
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

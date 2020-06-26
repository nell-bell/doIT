//
//  ToDoTableViewController.swift
//  doIT
//
//  Created by Kelly Tu on 6/24/20.
//  Copyright © 2020 julia nellie. All rights reserved.
//

import UIKit
import CoreData

class ToDoTableViewController: UITableViewController {
    
    var toDos : [ToDoCD] = []
    
    func getToDos (){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataToDos = try! context.fetch(ToDoCD.fetchRequest()) as? [ToDoCD] {
                toDos = coreDataToDos
                tableView.reloadData()
            }
            
        }
    }

    func createToDos() -> [ToDo] {
        let app = ToDo()
        app.name = "Make an app"
        app.important = true
        
        let kwk = ToDo()
        kwk.name = "Go to KWK Zoom"
        kwk.important = true
        
        return [app, kwk]
    }
    
   // var toDos : [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    func viewWillAppear(_animated: Bool) {
       getToDos()
       }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
*/
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDos.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let toDo = toDos[indexPath.row]
        
        if let name = toDo.name {
        if toDo.important {
            cell.textLabel?.text = name + "!"
        } else {
            cell.textLabel?.text = toDo.name
        }
        } 
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDos[indexPath.row]
        
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }


/*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Return false if you do not want the specified item to be editable.
        return true
    }
*/

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddToDoViewController {
            addVC.previousVC = self
        }
        if let completeVC = segue.destination as? CompleteToDoViewController {
            
            if let toDo = sender as? ToDoCD {
            completeVC.selectedToDo = toDo
            completeVC.previousVC = self
    }
}
        
}
}

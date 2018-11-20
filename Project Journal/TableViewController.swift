//
//  TableViewController.swift
//  Project Journal
//
//  Created by Тимур Аглиев on 20.11.2018.
//  Copyright © 2018 Тимур Аглиев. All rights reserved.
//Убрать список учеников на AddVC
//

import UIKit

class TableViewController: UITableViewController {
    
    var iP: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pupils.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(pupils[indexPath.row].name) \(pupils[indexPath.row].secondName)"
        cell.detailTextLabel?.text = pupils[indexPath.row].mark
        return cell
    }
    


    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    //Удаление ученика
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            removePupil(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    //Передача информации на AddVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? AddViewController else {return}
        switch segue.identifier {
        case "Eddit":
            if let indexPath = tableView.indexPathForSelectedRow {
                dvc.name = pupils[indexPath.row].name
                dvc.secondName = pupils[indexPath.row].secondName
                dvc.mark = pupils[indexPath.row].mark
                iP = indexPath.row
            }
        case "Add":
            addPupil(secondName: "", name: "", mark: "")
            iP = pupils.count-1
            
        default:
            break
        }
    }
    //Прием ифонрмации с AddVC
    @IBAction func uwindToMainScreen(segue: UIStoryboardSegue){
        switch segue.identifier {
        case "BackSave":
            let svc = segue.source as? AddViewController
            guard let sViewController = svc else {return}
            pupils[iP].mark = sViewController.markTextFiled.text!
            pupils[iP].name = sViewController.nameTextField.text!
            pupils[iP].secondName = sViewController.secondNameTextField.text!
            self.tableView.reloadData()
        case "BackCancel":
            pupils.remove(at: pupils.count-1)
            self.tableView.reloadData()
        case "JustBack":
            self.tableView.reloadData()
        default:
            break
        }
    }
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

//
//  TripTable.swift
//  fieldtrip1
//
//  Created by Rebecca Krieger on 12/16/16.
//  Copyright © 2016 Rebecca Krieger. All rights reserved.
//

import UIKit

class TripTable: UITableViewController {
    var trips : [TripClass] = [TripClass(named: "Cal Poly", day: "12/6/16", address: "1 Grand Ave"), TripClass(named: "Golden Gate Bridge", day: "12/20/16"), TripClass(named: "Google Offices", day: "12/30/16"), TripClass(named: "Amazon HQ", day: "12/30/16"), TripClass(named: "Science Center", day: "1/20/16")]
    var aNewTrip : TripClass?

    var ourDefaults = UserDefaults.standard
    
    var dateFormatter = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        self.navigationItem.rightBarButtonItem = addButton
    }
    func insertNewObject(_ sender: AnyObject) {
        // perform and list segue identifier
        
        // have the append get done in the add controller or after the unwind
        
        //prepare(for: (UIStoryboardSegue), addSegue, addSegue, sender: sender)
        performSegue(withIdentifier: "addSegue", sender:sender)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return trips.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tripcell", for: indexPath) as? tripCell
        // Configure the cell...
        cell?.place?.text = trips[indexPath.row].place
        cell?.date?.text = trips[indexPath.row].date
        return cell!
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "goToTrip" {
            let destVC = segue.destination as? TripScreen
            let selectedIndexPath = tableView.indexPathForSelectedRow
            destVC?.dataFromTable = trips[(selectedIndexPath?.row)!]
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

//
//  StudentList.swift
//  fieldtrip1
//
//  Created by Rebecca Krieger on 12/16/16.
//  Copyright © 2016 Rebecca Krieger. All rights reserved.
//

import UIKit

class StudentList: UIViewController {
    
    let schoolClass = [Student(nameHere: "Ada", lastSeenDate: NSDate.init(), phoneNum2: "123 - 456 - 780", here: true, ImageName: "Student0"),
                       Student(nameHere: "Bill", lastSeenDate: NSDate.init(), phoneNum2: "123 - 456 - 780", here: true, ImageName: "Student1"),
                       Student(nameHere: "Chris", lastSeenDate: NSDate.init(), phoneNum2: "123 - 456 - 780", here: true, ImageName: "Student2"),
                       Student(nameHere: "Debbie", lastSeenDate: NSDate.init(), phoneNum2: "123 - 456 - 780", here: true, ImageName: "Student3"),
                       Student(nameHere: "Grace", lastSeenDate: NSDate.init(), phoneNum2: "123 - 456 - 780", here: true, ImageName: "Student4"),
                       Student(nameHere: "Kernighan", lastSeenDate: NSDate.init(), phoneNum2: "123 - 456 - 780", here: true, ImageName: "Student5"),
                       Student(nameHere: "Larry", lastSeenDate: NSDate.init(), phoneNum2: "123 - 456 - 780", here: true, ImageName: "Student6"),
                       Student(nameHere: "Margret", lastSeenDate: NSDate.init(), phoneNum2: "123 - 456 - 780", here: false, ImageName: "Student7"),
                       Student(nameHere: "Marissa", lastSeenDate: NSDate.init(), phoneNum2: "123 - 456 - 780", here: false, ImageName: "Student8"),
                       Student(nameHere: "Sergey", lastSeenDate: NSDate.init(), phoneNum2: "123 - 456 - 780", here: false, ImageName: "Student9"),
                       Student(nameHere: "Steve", lastSeenDate: NSDate.init(), phoneNum2: "123 - 456 - 780", here: false, ImageName: "Student10"),
                       Student(nameHere: "Will", lastSeenDate: NSDate.init(), phoneNum2: "123 - 456 - 780", here: false, ImageName: "Student11")]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        //self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolClass.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customStudentCell", for: indexPath) as? StudentCell
        // Configure the cell...
        cell?.hereLabel.text = (schoolClass[indexPath.row].on ? "Here" : "Absent")
        cell?.name.text = schoolClass[indexPath.row].name
        return cell!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "mySegue" {
            let destVC = segue.destination as? StudentProfile
            let selectedIndexPath = tableView.indexPathForSelectedRow
            destVC?.dataFromTable = schoolClass[(selectedIndexPath?.row)!]
        }
        
    }
}

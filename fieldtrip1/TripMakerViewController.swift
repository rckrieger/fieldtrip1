//
//  TripMakerViewController.swift
//  fieldtrip1
//
//  Created by Rebecca Krieger on 12/16/16.
//  Copyright © 2016 Rebecca Krieger. All rights reserved.
//

import UIKit

class TripMakerViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    /*    if segue.identifier == "save"
        {
            let destVC = segue.destination as? TripTable
            let selectedIndexPath = tableView.indexPathForSelectedRow
            destVC?.dataFromTable = trips[(selectedIndexPath?.row)!]
            destVC?.placeHolder = (selectedIndexPath?.row)!
        }
        else
        {
        }
 */
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  StudentLayouts.swift
//  fieldtrip1
//
//  Created by Rebecca Krieger on 11/28/16.
//  Copyright © 2016 Rebecca Krieger. All rights reserved.
//

import UIKit

class StudentLayouts: UIViewController {
    @IBOutlet weak var segmentPower: UISegmentedControl!
    
    
    @IBOutlet weak var carpoolcontainer: UIView!
    
    @IBOutlet weak var studentlistcontainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func showComponent(sender: UISegmentedControl) {
        //day case
        if sender.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0.5, animations: {
                self.carpoolcontainer.alpha = 1
                self.studentlistcontainer.alpha = 0
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.carpoolcontainer.alpha = 0
                self.studentlistcontainer.alpha = 1
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

//
//  StudentProfile.swift
//  fieldtrip1
//
//  Created by Rebecca Krieger on 12/16/16.
//  Copyright © 2016 Rebecca Krieger. All rights reserved.
//

import UIKit

class StudentProfile: UIViewController {
    
    var dataFromTable : Student?
    
    @IBOutlet weak var passedNameLabel: UILabel!
    
    @IBOutlet weak var studentImage: UIImageView!
    
    @IBOutlet weak var lastSeenLabel: UILabel!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    
    var placeHolder = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        passedNameLabel.text = dataFromTable?.name
        studentImage.image = dataFromTable?.picture
        lastSeenLabel.text = dataFromTable?.lastSeen?.description
        
    }
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

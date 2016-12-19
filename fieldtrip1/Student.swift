//
//  Student.swift
//  fieldtrip1
//
//  Created by Rebecca Krieger on 12/16/16.
//  Copyright © 2016 Rebecca Krieger. All rights reserved.
//

import Foundation
import UIKit

class Student{
    
    var name: String
    var lastSeen: NSDate?
    var phoneNum: String?
    var on = false
    var picture : UIImage?
    init(nameHere: String) {
        self.name = nameHere
    }
    init(nameHere: String, phoneNum2: String, here: Bool){
        self.name = nameHere
        self.phoneNum = phoneNum2
        self.on = here
    }
    init(nameHere: String, lastSeenDate: NSDate, phoneNum2: String, here: Bool){
        self.name = nameHere
        self.lastSeen = lastSeenDate
        self.phoneNum = phoneNum2
        self.on = here
    }
    init(nameHere: String, phoneNum2: String, here: Bool, ImageName: String){
        self.name = nameHere
        self.phoneNum = phoneNum2
        self.on = here
        self.picture = UIImage(named: ImageName)
    }
    init(nameHere: String, lastSeenDate: NSDate, phoneNum2: String, here: Bool, ImageName: String){
        self.name = nameHere
        self.lastSeen = lastSeenDate
        self.phoneNum = phoneNum2
        self.on = here
        self.picture = UIImage(named: ImageName)
    }
    
}

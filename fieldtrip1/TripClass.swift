//
//  TripClass.swift
//  fieldtrip1
//
//  Created by Rebecca Krieger on 12/16/16.
//  Copyright © 2016 Rebecca Krieger. All rights reserved.
//

import Foundation
import UIKit
//import MapKit
//MKAnnotation
class TripClass: NSObject {
    
   // var coordinate: CLLocationCoordinate2D? = nil
    var place: String?
    var when: String?
    var subtitle: String?
    var date: String?
    init(named: String, day: String)
    {
        place = named
        date = day
    }
    init(named: String, day: String, address: String)
    {
        place = named
        date = day
        subtitle = address
        
    }
    
    
   /* init(coord: CLLocationCoordinate2D, named: String, detail: String) {
        coordinate = coord
        place = named
        subtitle = detail
        
        super.init()
    }
 
*/
}

//
//  TripScreen.swift
//  fieldtrip1
//
//  Created by Rebecca Krieger on 12/16/16.
//  Copyright © 2016 Rebecca Krieger. All rights reserved.
//

import UIKit
import MapKit

class TripScreen: UIViewController {

    var dataFromTable : TripClass?
    
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var timeRange: UILabel!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var people: UIButton!
    @IBOutlet weak var info: UIButton!
    
    @IBOutlet weak var checkin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        address.text = dataFromTable?.place
        timeRange.text = dataFromTable?.when
        location.text = dataFromTable?.subtitle

        // Do any additional setup after loading the view.
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

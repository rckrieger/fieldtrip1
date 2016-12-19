//
//  expandableVC.swift
//  fieldtrip1
//
//  Created by Rebecca Krieger on 12/18/16.
//  Copyright © 2016 Rebecca Krieger. All rights reserved.
//

import UIKit

class expandableVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomCellDelegate  {
        
        // MARK: IBOutlet Properties
        
        @IBOutlet weak var tblExpandable: UITableView!
        
        
        // MARK: Variables
        
        var cellDescriptors: [[[String:Any]]]?
        
        var visibleRowsPerSection = [[Int]]()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
        }
        
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            configureTableView()
            
            loadCellDescriptors()
        }
        
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
        // MARK: Custom Functions
        
        func configureTableView() {
            tblExpandable.delegate = self
            tblExpandable.dataSource = self
            tblExpandable.tableFooterView = UIView(frame: CGRect.zero)
            
            tblExpandable.register(UINib(nibName: "NormalCell", bundle: nil), forCellReuseIdentifier: "idCellNormal")
            tblExpandable.register(UINib(nibName: "TextfieldCell", bundle: nil), forCellReuseIdentifier: "idCellTextfield")
            tblExpandable.register(UINib(nibName: "DatePickerCell", bundle: nil), forCellReuseIdentifier: "idCellDatePicker")
            tblExpandable.register(UINib(nibName: "SwitchCell", bundle: nil), forCellReuseIdentifier: "idCellSwitch")
            tblExpandable.register(UINib(nibName: "ValuePickerCell", bundle: nil), forCellReuseIdentifier: "idCellValuePicker")
            tblExpandable.register(UINib(nibName: "SliderCell", bundle: nil), forCellReuseIdentifier: "idCellSlider")
        }
        
        
        func loadCellDescriptors() {
            if let path = Bundle.main.path(forResource: "CellDescriptor", ofType: "plist") {
                cellDescriptors = NSMutableArray(contentsOfFile: path) as? [[[String:Any]]]
                getIndicesOfVisibleRows()
                tblExpandable.reloadData()
            }
        }
        
        
        func getIndicesOfVisibleRows() {
            visibleRowsPerSection.removeAll()
            
            for currentSectionCells in cellDescriptors! {
                var visibleRows = [Int]()
                
                for row in 0..<currentSectionCells.count {
                    if currentSectionCells[row]["isVisible"] as! Bool == true {
                        visibleRows.append(row)
                    }
                }
                
                visibleRowsPerSection.append(visibleRows)
            }
        }
        
        
        func getCellDescriptorForIndexPath(_ indexPath: IndexPath) -> [String: Any] {
            let indexOfVisibleRow = visibleRowsPerSection[indexPath.section][indexPath.row]
            let aBunchODescriptors = cellDescriptors
            
            let cellDescriptor = aBunchODescriptors?[indexPath.section][indexOfVisibleRow]
            return cellDescriptor!
        }
        
        
        // MARK: UITableView Delegate and Datasource Functions
        
        func numberOfSections(in tableView: UITableView) -> Int {
            if cellDescriptors != nil {
                return cellDescriptors!.count
            }
            else {
                return 0
            }
        }
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return visibleRowsPerSection[section].count
        }
        
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            switch section {
            case 0:
                return "Personal"
                
            case 1:
                return "Preferences"
                
            default:
                return "Work Experience"
            }
        }
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let currentCellDescriptor = getCellDescriptorForIndexPath(indexPath)
            let cell = tableView.dequeueReusableCell(withIdentifier: currentCellDescriptor["cellIdentifier"] as! String, for: indexPath) as! CustomCell
            
            if currentCellDescriptor["cellIdentifier"] as! String == "idCellNormal" {
                if let primaryTitle = currentCellDescriptor["primaryTitle"] {
                    cell.textLabel?.text = primaryTitle as? String
                }
                
                if let secondaryTitle = currentCellDescriptor["secondaryTitle"] {
                    cell.detailTextLabel?.text = secondaryTitle as? String
                }
            }
            else if currentCellDescriptor["cellIdentifier"] as! String == "idCellTextfield" {
                cell.textField.placeholder = currentCellDescriptor["primaryTitle"] as? String
            }
            else if currentCellDescriptor["cellIdentifier"] as! String == "idCellSwitch" {
                cell.lblSwitchLabel.text = currentCellDescriptor["primaryTitle"] as? String
                
                let value = currentCellDescriptor["value"] as? String
                cell.swMaritalStatus.isOn = (value == "true") ? true : false
            }
            else if currentCellDescriptor["cellIdentifier"] as! String == "idCellValuePicker" {
                cell.textLabel?.text = currentCellDescriptor["primaryTitle"] as? String
            }
            else if currentCellDescriptor["cellIdentifier"] as! String == "idCellSlider" {
                let value = currentCellDescriptor["value"] as! String
                cell.slExperienceLevel.value = (value as NSString).floatValue
            }
            
            cell.delegate = self
            
            return cell
        }
        
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            let currentCellDescriptor = getCellDescriptorForIndexPath(indexPath)
            
            switch currentCellDescriptor["cellIdentifier"] as! String {
            case "idCellNormal":
                return 60.0
                
            case "idCellDatePicker":
                return 270.0
                
            default:
                return 44.0
            }
        }
        
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let indexOfTappedRow = visibleRowsPerSection[indexPath.section][indexPath.row]
            
            if cellDescriptors?[indexPath.section][indexOfTappedRow]["isExpandable"] as! Bool == true {
                var shouldExpandAndShowSubRows = false
                if cellDescriptors?[indexPath.section][indexOfTappedRow]["isExpanded"] as! Bool == false {
                    // In this case the cell should expand.
                    shouldExpandAndShowSubRows = true
                }
                
                cellDescriptors?[indexPath.section][indexOfTappedRow]["isExpanded"] = shouldExpandAndShowSubRows
                for i in (indexOfTappedRow + 1)...(indexOfTappedRow + (cellDescriptors?[indexPath.section][indexOfTappedRow]["additionalRows"] as! Int)) {
                    cellDescriptors?[indexPath.section][i]["isVisible"] = shouldExpandAndShowSubRows
                }
            }
            else {
                if cellDescriptors?[indexPath.section][indexOfTappedRow]["cellIdentifier"] as! String == "idCellValuePicker" {
                    var indexOfParentCell: Int!
                    
                    for i in (0...(indexOfTappedRow - 1)).reversed() {
                        if cellDescriptors?[indexPath.section][i]["isExpandable"] as! Bool == true {
                            indexOfParentCell = i
                            break
                        }
                    }
                    
                    cellDescriptors?[indexPath.section][indexOfParentCell]["primaryTitle"] = (tblExpandable.cellForRow(at: indexPath) as! CustomCell).textLabel?.text
                    cellDescriptors?[indexPath.section][indexOfParentCell]["isExpanded"] = false
                    
                    
                    for i in (indexOfParentCell + 1)...(indexOfParentCell + (cellDescriptors?[indexPath.section][indexOfParentCell]["additionalRows"] as! Int)) {
                        cellDescriptors?[indexPath.section][i]["isVisible"] = false
                    }
                }
            }
            
            getIndicesOfVisibleRows()
            tblExpandable.reloadSections(IndexSet(integer: indexPath.section), with: UITableViewRowAnimation.fade)
        }
        
        
        // MARK: CustomCellDelegate Functions
        
        func dateWasSelected(_ selectedDateString: String) {
            let dateCellSection = 0
            let dateCellRow = 3
            
            cellDescriptors?[dateCellSection][dateCellRow]["primaryTitle"] = selectedDateString
            tblExpandable.reloadData()
        }
        
        
        func maritalStatusSwitchChangedState(_ isOn: Bool) {
            let maritalSwitchCellSection = 0
            let maritalSwitchCellRow = 6
            
            let valueToStore = (isOn) ? "true" : "false"
            let valueToDisplay = (isOn) ? "Married" : "Single"
            
            cellDescriptors?[maritalSwitchCellSection][maritalSwitchCellRow]["value"] = valueToStore
            cellDescriptors?[maritalSwitchCellSection][maritalSwitchCellRow - 1]["primaryTitle"] = valueToDisplay
            tblExpandable.reloadData()
        }
        
        
        func textfieldTextWasChanged(_ newText: String, parentCell: CustomCell) {
            let parentCellIndexPath = tblExpandable.indexPath(for: parentCell)
            
            let currentFullname = cellDescriptors?[0][0]["primaryTitle"] as! String
            let fullnameParts = currentFullname.components(separatedBy: " ")
            
            var newFullname = ""
            
            if parentCellIndexPath?.row == 1 {
                if fullnameParts.count == 2 {
                    newFullname = "\(newText) \(fullnameParts[1])"
                }
                else {
                    newFullname = newText
                }
            }
            else {
                newFullname = "\(fullnameParts[0]) \(newText)"
            }
            
            cellDescriptors?[0][0]["primaryTitle"] = newFullname
            tblExpandable.reloadData()
        }
        
        
        func sliderDidChangeValue(_ newSliderValue: String) {
            cellDescriptors?[2][0]["primaryTitle"] = newSliderValue
            cellDescriptors?[2][1]["value"] = newSliderValue
            tblExpandable.reloadSections(IndexSet(integer: 2), with: UITableViewRowAnimation.none)
        }
        
}


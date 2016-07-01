//
//  HIITSettingsViewController.swift
//  HIITimer
//
//  Created by hannah gaskins on 6/30/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

import UIKit

class HIITSettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var setsPickerView: UIPickerView!
    @IBOutlet weak var activeTimePickerView: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting setsPickerView delegate and dataSource to the HIITSettingsVC
        setsPickerView.delegate = self
        setsPickerView.dataSource = self
        
        activeTimePickerView.delegate = self
        activeTimePickerView.dataSource = self
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
    // MARK: PickerView Info
    
    var setsArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]
    
    var activeTimeArray = ["5", "10", "15", "20", "25", "30", "35", "45", "50", "55", "60", "65", "70"]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView === setsPickerView {
            return setsArray.count
        } else if pickerView == activeTimeArray {
            return activeTimeArray.count
        } else {
            return 0
        }
        
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        if pickerView === setsPickerView {
            return setsArray[row]
        } else if pickerView == activeTimeArray {
            return activeTimeArray[row]
        } else {
            return nil
        }

    }

}

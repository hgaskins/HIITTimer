//
//  StagingViewController.swift
//  HIITimer
//
//  Created by hannah gaskins on 7/1/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

import UIKit


class StagingViewController: UIViewController {
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        printUserSettings()
        
        
    }
    
    func printUserSettings() {
        
        print(UserRoutine.shared.sets)
        print(UserRoutine.shared.activeTime)
        print(UserRoutine.shared.restTime)
        
    }

    
    
    
}
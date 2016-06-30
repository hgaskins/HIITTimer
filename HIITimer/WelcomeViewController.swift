//
//  WelcomeViewController.swift
//  HIITimer
//
//  Created by hannah gaskins on 6/30/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

import Foundation
import UIKit
// make button outlet with rounded button

class WecomeViewController: UIViewController {
    
    @IBOutlet weak var letsGoButton: UIButton!
    
    
    override func viewDidLoad() {
        //
        setupAppearance()
    }
    
    
    func setupAppearance() {
        //
        letsGoButton.layer.cornerRadius = 3.0
    }
    
    
}
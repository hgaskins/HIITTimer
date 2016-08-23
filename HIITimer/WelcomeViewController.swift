//
//  WelcomeViewController.swift
//  HIITimer
//
//  Created by hannah gaskins on 6/30/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

import Foundation
import UIKit

class WecomeViewController: UIViewController {
    
    @IBOutlet weak var letsGoButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupAppearance()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        self.navigationController!.navigationBar.hidden = false
    }
    
    private func setupAppearance() {
        
//        letsGoButton.layer.cornerRadius = 3.0
        letsGoButton.layer.opacity = 0.9
    }
    
    
}
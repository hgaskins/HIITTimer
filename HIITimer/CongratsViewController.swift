//
//  CongratsViewController.swift
//  HIITimer
//
//  Created by hannah gaskins on 7/6/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

import UIKit


class CongratsViewContoller: UIViewController {
    
    @IBOutlet weak var goAgainButton: UIButton!
    @IBAction func goAgainButton(sender: UIButton) {
        // takes user back to settingsVC with seque in Main.storyboard
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        
        setupAppearance()
    }
    
    private func setupAppearance() {
        
        self.navigationController!.navigationBar.hidden = true
//        goAgainButton.layer.cornerRadius = 3.0
        goAgainButton.layer.opacity = 0.9
    }
}
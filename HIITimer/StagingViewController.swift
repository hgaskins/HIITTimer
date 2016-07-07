//
//  StagingViewController.swift
//  HIITimer
//
//  Created by hannah gaskins on 7/1/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

import UIKit
import AVFoundation


class StagingViewController: UIViewController {
    
    var timer: NSTimer?
    
    @IBOutlet weak var countDownTimer: UILabel!
    @IBOutlet weak var activeOrRestTimerLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setCountDownLabel()
    }
    
    /*
     
     For 3.2.1 IntroCountDown
     
     */
    
    var initialTimerValue = 3
    var setsCount = UserRoutine.shared.sets
    var activeTimerValue = UserRoutine.shared.activeTime
    var restTimerValue = UserRoutine.shared.restTime
    
    func update() {
        
        if(initialTimerValue > 0) {
            initialTimerValue -= 1
            countDownTimer.text = "\(initialTimerValue)"
            
        }
        if initialTimerValue == 0 {
            NSOperationQueue.mainQueue().addOperationWithBlock({
                self.timer?.invalidate()
                self.timer = nil
                self.startActiveTimer()
            })
        }
    }
    
    func setCountDownLabel() {
        
        countDownTimer.text = String(initialTimerValue)
        let blueColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0)
        view.backgroundColor = blueColor
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        activeOrRestTimerLabel.text = "get ready 🤘"
    }
    
    /*
     
     for startActiveTimer
     
     */
    
    
    func updateActiveTimer() {
        
        if(activeTimerValue > 0) {
            activeTimerValue -= 1
            countDownTimer.text = "\(activeTimerValue)"
        }
        
        if activeTimerValue == 0 {
            NSOperationQueue.mainQueue().addOperationWithBlock({ 
                self.timer?.invalidate()
                self.timer = nil
                self.startRestTimer()
            })
        }
    }
    
    
    func startActiveTimer() {
        
        activeTimerValue = UserRoutine.shared.activeTime
        countDownTimer.text = String(activeTimerValue)
        let orangeColor = UIColor(red: 242/255.0, green: 94/255.0, blue: 5/255.0, alpha: 1.0)
        view.backgroundColor = orangeColor
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(self.updateActiveTimer), userInfo: nil, repeats: true)
        activeOrRestTimerLabel.text = "work 🏋🏿"
    }
    
    /*
     
     for rest timer
     
     */
    
    
    
    func updateRestTimer() {
        
        if restTimerValue > 0 {
            restTimerValue -= 1
            countDownTimer.text = "\(restTimerValue)"
            
        }
        if restTimerValue == 0 {
            NSOperationQueue.mainQueue().addOperationWithBlock({
                self.timer?.invalidate()
                self.timer = nil
                if self.setsCount > 0 {
                    self.startActiveTimer()
                } else if self.setsCount == 0 {
                    self.performSegueWithIdentifier("congratsSegue", sender: nil)
                }
            })
        }
    }
    
    func startRestTimer() {
        
        restTimerValue = UserRoutine.shared.restTime
        countDownTimer.text = String(restTimerValue)
        let restColor = UIColor(red: 20/255.0, green: 94/255.0, blue: 140/255.0, alpha: 1)
        view.backgroundColor = restColor
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(self.updateRestTimer), userInfo: nil, repeats: true)
        activeOrRestTimerLabel.text = "rest 🛌"
        
         setsCount -= 1
    }
   
}
//
//  StagingViewController.swift
//  HIITimer
//
//  Created by hannah gaskins on 7/1/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

import UIKit


class StagingViewController: UIViewController {
    
    // variables for timers
    var timer = NSTimer()
    var second = Int()
    var fractions = Int()
    var timerString: String = ""
    
    @IBOutlet weak var countDownTimer: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printUserSettings() // for testing remove when finished
        countDownTimer.text = "3" // on load 3 seconds displays
        setCountDownLabel()
        
    }
    
    // ------------------ for testing remove when finished
    func printUserSettings() {
        print(UserRoutine.shared.sets)
        print(UserRoutine.shared.activeTime)
        print(UserRoutine.shared.restTime)
    }
    
    /*
     
     For 3.2.1 IntroCountDown
     
     */
    
    var initialTimerValue = 3
    
    func update() {
        
        if(initialTimerValue > 0) {
            countDownTimer.text = "\(initialTimerValue)"
        }
        if initialTimerValue == 0 {
            timer.invalidate()
            startActiveTimer()
        }
        initialTimerValue -= 1
        
    }
    
    func setCountDownLabel() {
        
        let blueColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 255/255.0, alpha: 1.0)
        view.backgroundColor = blueColor
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    /*
     
     for startActiveTimer
     
     */
    
    var activeTimerValue = UserRoutine.shared.activeTime
    
    func updateActiveTimer() {
        if(activeTimerValue > 0) {
            countDownTimer.text = "\(activeTimerValue)"
        }
        
        if activeTimerValue == 0 {
            timer.invalidate()
            startRestTimer()
        }
        activeTimerValue -= 1
    }
    
    
    func startActiveTimer() {
        
        countDownTimer.text = String(activeTimerValue)
        let orangeColor = UIColor(red: 235/255.0, green: 102/255.0, blue: 40/255.0, alpha: 1.0)
        view.backgroundColor = orangeColor
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(self.updateActiveTimer), userInfo: nil, repeats: true)

    }
    
    var restTimerValue = UserRoutine.shared.restTime
    
    func updateRestTimer() {
        if restTimerValue > 0 {
            countDownTimer.text = "\(restTimerValue)"
        }
        if restTimerValue == 0 {
            timer.invalidate()
            startActiveTimer()
        }
        restTimerValue -= 1
    }
    
    func startRestTimer() {
        
        countDownTimer.text = String(restTimerValue)
        let restColor = UIColor(red: 63/255.0, green: 127/255.0, blue: 191/255.0, alpha: 1)
        view.backgroundColor = restColor
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(self.updateRestTimer), userInfo: nil, repeats: true)
    }
   
}
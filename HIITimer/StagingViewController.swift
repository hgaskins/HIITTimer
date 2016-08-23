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
    var initialTimerValue = 3
    var setsCount = UserRoutine.shared.sets
    var activeTimerValue = UserRoutine.shared.activeTime
    var restTimerValue = UserRoutine.shared.restTime
    
    var bleep: AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var countDownTimer: UILabel!
    @IBOutlet weak var activeOrRestTimerLabel: UILabel!
    @IBOutlet weak var emoji: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setCountDownLabel()
        prepAudio()
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Reset", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(StagingViewController.back(_:)))
        self.navigationItem.leftBarButtonItem = newBackButton
        
    }
    
    func back(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
        timer?.invalidate()
    }
    
    
    
    func prepAudio() {
        
        let urlBleep = NSBundle.mainBundle().pathForResource("alert", ofType: "mp3")!

        do {
            bleep = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: urlBleep))
        }
        catch {
            print("audio error")
        }
        bleep.prepareToPlay()
    }
    
    func emojiAnimation() {
        
        UILabel.animateKeyframesWithDuration(1.0, delay: 0, options: .BeginFromCurrentState, animations: {
            UILabel.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.25, animations: {
                self.emoji.transform = CGAffineTransformMakeScale(0.5, 0.5)
            })
            UILabel.addKeyframeWithRelativeStartTime(0.25, relativeDuration: 0.50, animations: {
                self.emoji.transform = CGAffineTransformMakeScale(1.0, 1.0)
            })
            
            }, completion: nil)
    }
    
    
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

        NSOperationQueue.mainQueue().addOperationWithBlock { 
            self.bleep.play()
        }
        countDownTimer.text = String(initialTimerValue)
        let blueColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0)
        view.backgroundColor = blueColor
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        activeOrRestTimerLabel.text = "get ready 🤘"
        emoji.text = ""
    }
    
    
    func updateActiveTimer() {
        
        if(activeTimerValue > 0) {
            activeTimerValue -= 1
            countDownTimer.text = "\(activeTimerValue)"
            emojiAnimation()
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
        
        NSOperationQueue.mainQueue().addOperationWithBlock {
            self.bleep.play()
        }
        activeTimerValue = UserRoutine.shared.activeTime
        countDownTimer.text = String(activeTimerValue)
        let orangeColor = UIColor(red: 242/255.0, green: 94/255.0, blue: 5/255.0, alpha: 1.0)
        view.backgroundColor = orangeColor
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(self.updateActiveTimer), userInfo: nil, repeats: true)
        activeOrRestTimerLabel.text = "work"
        emoji.text = "🏋🏿"
    }

    
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
        
        NSOperationQueue.mainQueue().addOperationWithBlock {
            self.bleep.play()
        }
        restTimerValue = UserRoutine.shared.restTime
        countDownTimer.text = String(restTimerValue)
        let restColor = UIColor(red: 20/255.0, green: 94/255.0, blue: 140/255.0, alpha: 1)
        view.backgroundColor = restColor
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(self.updateRestTimer), userInfo: nil, repeats: true)
        activeOrRestTimerLabel.text = "rest 🛌"
        emoji.text = ""
        
         setsCount -= 1
    }
   
}
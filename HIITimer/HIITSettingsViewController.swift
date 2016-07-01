//
//  HIITSettingsViewController.swift
//  HIITimer
//
//  Created by hannah gaskins on 6/30/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

import UIKit


class HIITSettingsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
    
    @IBOutlet weak var collectionViewOne: UICollectionView!
    @IBOutlet weak var collectionViewTwo: UICollectionView!
    @IBOutlet weak var collectionViewThree: UICollectionView!
    
    @IBOutlet weak var letsHIITButton: UIButton!
    
    var setsCell = 0
    var activeCell = 0
    var restCell = 0
    
    
    var arrayOne = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    
    var arrayTwo = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // for UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collectionViewOne {
            return arrayOne.count
        } else if collectionView == collectionViewTwo || collectionView == collectionViewThree {
            return arrayTwo.count
        }
        
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as!
        CollectionViewCell
        
        cell.layer.cornerRadius = 50.0
        
        if collectionView == collectionViewOne {
            cell.cellLabel.text = String(arrayOne[indexPath.row])
        } else if collectionView == collectionViewTwo || collectionView == collectionViewThree {
            cell.cellLabel.text = String(arrayTwo[indexPath.row])
        }
        
        return cell
        
    }
    
    
    // For UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        var cell = collectionView.cellForItemAtIndexPath(indexPath)
        
        if collectionView == collectionViewOne {
            
            setsCell = self.arrayOne[indexPath.row]
            cell?.layer.backgroundColor = UIColor.cyanColor().CGColor
        }
        
        if collectionView == collectionViewTwo {
            
            activeCell = self.arrayTwo[indexPath.row]
        }
        
        if collectionView == collectionViewThree {
            
            restCell = self.arrayTwo[indexPath.row]
        }
        
        
        
        UserRoutine.shared.setUserRoutine(setsCell, activeTime: activeCell, restTime: restCell)
        
    }
    
    
    
    private func setupAppearance() {
        //
        letsHIITButton.layer.cornerRadius = 3.0
        letsHIITButton.layer.opacity = 0.9
    }
    
    @IBAction func letsHIITButtonSelected(sender: UIButton) {
        
        if setsCell > 0 && activeCell > 0 && restCell > 0 {
            
            let stageVC = self.storyboard?.instantiateViewControllerWithIdentifier("StagingViewController") as? StagingViewController
            
            self.navigationController?.pushViewController(stageVC!, animated: true)
            
        } else {
            
            // alert user to sselect all options
            
            print("🍊")
        }
    }
    
}



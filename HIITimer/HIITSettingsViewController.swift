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
    
    var arrayOne = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    
    var arrayTwo = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60]
    
    var selectedSetsNumber = [Int]()
    var selectedActiveNumber = [Int]()
    var selectedRestNumber = [Int]()
    
    var userSettingsInput = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        collectionViewOne.delegate = self // the equivalent of dragging within the storyboard to set delegate
        
        
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
    
//    var userSettingsInput = [Int]()
    
    // For UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        if collectionView == collectionViewOne {
            let setsCell = self.arrayOne[indexPath.row]
            selectedActiveNumber.append(setsCell)
            print(setsCell)
            
        }
        
        if collectionView == collectionViewTwo {
            let activeCell = self.arrayTwo[indexPath.row]
            selectedActiveNumber.append(activeCell)
            print(activeCell)
        }
        
        if collectionView == collectionViewThree {
            let restCell = self.arrayTwo[indexPath.row]
            selectedRestNumber.append(restCell)
            print(restCell)
        }
        
        
    }
    
    
}



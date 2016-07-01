//
//  UserRoutine.swift
//  HIITimer
//
//  Created by hannah gaskins on 7/1/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

import UIKit

class UserRoutine {
    
    static let shared = UserRoutine()  // singleton
    
    var sets = 0
    var activeTime = 0
    var restTime = 0
    
    init() {}
    
    // sets the UserRoutine variables, and holds object settings no matter where we are in the app
    
    func setUserRoutine(sets: Int, activeTime: Int, restTime: Int) {
        self.sets = sets
        self.activeTime = activeTime
        self.restTime = restTime
    }
    
    
    
}

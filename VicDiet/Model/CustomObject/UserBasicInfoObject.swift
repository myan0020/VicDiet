//
//  FoodObject.swift
//  VicDiet
//
//  Created by Ming Yang on 6/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class UserBasicInfoObject: NSObject {
    
    var age : NSNumber
    var gender: String
    var weight: NSNumber
    
    init(age: NSNumber,gender: String,weight: NSNumber) {
        
        self.age = age
        self.gender = gender
        self.weight = weight
        
    }
    
    
    
}

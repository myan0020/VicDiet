//
//  FoodObject.swift
//  VicDiet
//
//  Created by Ming Yang on 6/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class AveragePersonGroupObject: NSObject {
    
    var ageLower : NSNumber
    var ageUpper: NSNumber
    var gender: String
    var weight: NSNumber
    
    var protein: NSNumber
    var calcium: NSNumber
    var totalFat: NSNumber
    var sodium: NSNumber
    var vitaminC: NSNumber
    var vitaminA: NSNumber
    
    init(ageLower : NSNumber, ageUpper: NSNumber, gender: String,weight: NSNumber,protein: NSNumber,calcium: NSNumber,totalFat: NSNumber,sodium: NSNumber,vitaminC: NSNumber,vitaminA: NSNumber) {
        
        self.ageLower = ageLower
        self.ageUpper = ageUpper
        self.gender = gender
        self.weight = weight
        
        self.protein = protein
        self.calcium = calcium
        self.totalFat = totalFat
        self.sodium = sodium
        self.vitaminC = vitaminC
        self.vitaminA = vitaminA
        
    }
    
    
    
}

//
//  MealObject.swift
//  VicDiet
//
//  Created by Ming Yang on 18/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class MealObject: NSObject {
    var foodObjectList: [FoodObject]
    var name : String
    init(foodObjectList: [FoodObject]) {
        self.name = "Untitled Meal"
        self.foodObjectList = foodObjectList
 
    }
}

//
//  FoodObject.swift
//  VicDiet
//
//  Created by Ming Yang on 6/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class FoodObject: NSObject {

    var name : String
    var protein: NSNumber
    var surveyFlag: String
    var calcium: NSNumber
    var totalFat: NSNumber
    var sodium: NSNumber
    var vitaminC: NSNumber
    var vitaminA: NSNumber
    var num: Double
    var mark: Double
    
    
    init(name: String, protein: NSNumber, surveyFlag: String,calcium: NSNumber,totalFat: NSNumber, sodium: NSNumber,vitaminC: NSNumber,vitaminA: NSNumber) {
        self.name = name
        self.protein = protein
        self.surveyFlag = surveyFlag
        self.calcium = calcium
        self.totalFat = totalFat
        self.sodium = sodium
        self.vitaminC = vitaminC
        self.vitaminA = vitaminA
        self.num = 1.00
        self.mark = 1.00
    }
    
    func setWithMultipler(multipler: Double){
        self.protein = NSNumber(value: self.protein.doubleValue*multipler)
        self.calcium = NSNumber(value: self.calcium.doubleValue*multipler)
        self.totalFat = NSNumber(value: self.totalFat.doubleValue*multipler)
        self.sodium = NSNumber(value: self.sodium.doubleValue*multipler)
        self.vitaminC = NSNumber(value: self.vitaminC.doubleValue*multipler)
        self.vitaminA = NSNumber(value: self.vitaminA.doubleValue*multipler)
        self.num = multipler

    }
    
//    func setDistanceValueWithFoodObject(foodObject: FoodObject){
//
//        self.num = 2.3
////        if foodObject.protein.doubleValue - self.protein.doubleValue >= 0.0{
////
////            print(foodObject.protein.doubleValue)
////            print(self.protein.doubleValue)
////            print(self.mark + foodObject.protein.doubleValue)
////            print(self.mark + foodObject.protein.doubleValue - self.protein.doubleValue)
////        }else{
////            self.mark = self.mark - (foodObject.protein.doubleValue - self.protein.doubleValue)
////        }
////
////        if foodObject.calcium.doubleValue - self.calcium.doubleValue >= 0.0{
////            self.mark = self.mark + foodObject.calcium.doubleValue - self.calcium.doubleValue
////        }else{
////            self.mark = self.mark - (foodObject.calcium.doubleValue - self.calcium.doubleValue)
////        }
////
////        if foodObject.totalFat.doubleValue - self.totalFat.doubleValue >= 0.0{
////            self.mark = self.mark + foodObject.totalFat.doubleValue - self.totalFat.doubleValue
////        }else{
////            self.mark = self.mark - (foodObject.totalFat.doubleValue - self.totalFat.doubleValue)
////        }
////
////        if foodObject.sodium.doubleValue - self.sodium.doubleValue >= 0.0{
////            self.mark = self.mark + foodObject.sodium.doubleValue - self.sodium.doubleValue
////        }else{
////            self.mark = self.mark - (foodObject.sodium.doubleValue - self.sodium.doubleValue)
////        }
////
////        if foodObject.vitaminC.doubleValue - self.vitaminC.doubleValue >= 0.0{
////            self.mark = self.mark + foodObject.vitaminC.doubleValue - self.vitaminC.doubleValue
////        }else{
////            self.mark = self.mark - (foodObject.vitaminC.doubleValue - self.vitaminC.doubleValue)
////        }
////
////        if foodObject.vitaminA.doubleValue - self.vitaminA.doubleValue >= 0.0{
////            self.mark = self.mark + foodObject.vitaminA.doubleValue - self.vitaminA.doubleValue
////        }else{
////            self.mark = self.mark - (foodObject.vitaminA.doubleValue - self.vitaminA.doubleValue)
////        }
//
//       print(self.mark)
//
//
//    }
//
}

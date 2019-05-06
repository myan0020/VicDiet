//
//  FoodObject.swift
//  VicDiet
//
//  Created by Ming Yang on 6/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class IntakeProgressObject: NSObject {
    
    var proteinProgress:Double
    var calciumProgress: Double
    var totalFatProgress: Double
    var sodiumProgress: Double
    var vitaminCProgress: Double
    var vitaminAProgress: Double
    var progressMark: Double
    
    init(proteinProgress: Double, calciumProgress: Double,totalFatProgress: Double, sodiumProgress: Double,vitaminCProgress: Double,vitaminAProgress: Double,progressMark: Double) {
        self.proteinProgress = proteinProgress
        self.calciumProgress = calciumProgress
        self.totalFatProgress = totalFatProgress
        self.sodiumProgress = sodiumProgress
        self.vitaminCProgress = vitaminCProgress
        self.vitaminAProgress = vitaminAProgress
        self.progressMark = progressMark
    }
    
    func setProteinProgress(proteinProgress: Double){
        self.proteinProgress = proteinProgress
    }
    func setCalciumProgress(calciumProgress: Double){
        self.calciumProgress = calciumProgress
    }
    func setTotalFatProgress(totalFatProgress: Double){
        self.totalFatProgress = totalFatProgress
    }
    func setSodiumProgress(sodiumProgress: Double){
        self.sodiumProgress = sodiumProgress
    }
    func setVitaminCProgress(vitaminCProgress: Double){
        self.vitaminCProgress = vitaminCProgress
    }
    func setVitaminAProgress(vitaminAProgress: Double){
        self.vitaminAProgress = vitaminAProgress
    }
    func setProgressMark(progressMark: Double){
        self.progressMark = progressMark
    }
    
}

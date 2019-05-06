//
//  SwippingTextDict.swift
//  VicDiet
//
//  Created by Ming Yang on 7/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class SwippingTextDict: NSObject {

    var age: String
    var gender: String
    var weight: String
    
    init(age: String,gender: String,weight: String) {
        self.age = age
        self.gender = gender
        self.weight = weight
    }
}

//
//  HomeDataSourceController.swift
//  VicDiet
//
//  Created by Ming Yang on 20/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import Foundation
import Firebase

struct Service{

    static let sharedInstance = Service()
    
    let foodRef = Database.database().reference().child("OpenDataRepository").child("FoodNutrient")
    let personGroupStandardRef = Database.database().reference().child("OpenDataRepository").child("PersonGroupStandard")
    let userRef = Database.database().reference().child("User")
    let numOfFoodItem = 0
    let numOfPersonGroup = 58
    let numOfFood = 5740
    func fetchFoodNutrient(completion: @escaping (_ food: FoodObject, _ number: Int) -> ()){
        for i in 0...25{
            foodRef.child("\(i)").observe(.childAdded, with: { (snapshot) -> Void in
                let dictionary = snapshot.value as? NSDictionary
                let Name = dictionary?["Food Name"] as? String ?? ""
                let Protein = dictionary?["Protein (g)"] as? NSNumber
                let Survey = dictionary?["Survey flag"] as? String ?? ""
                let Calcium = dictionary?["Calcium (Ca) (mg)"] as? NSNumber
                let fat = dictionary?["Total fat (g)"] as? NSNumber
                let Sodium = dictionary?["Sodium (Na) (mg)"] as? NSNumber
                let C = dictionary?["Vitamin C (mg)"] as? NSNumber
                let A = dictionary?["Vitamin A retinol equivalents (µg)"] as? NSNumber
                let food = FoodObject(name: Name, protein: Protein!, surveyFlag: Survey, calcium: Calcium!, totalFat: fat!, sodium: Sodium!, vitaminC: C!, vitaminA: A!)
                completion(food,i)
            })
        }
    }
    func fetchFoodNutrientExtra(completion: @escaping (_ food: FoodObject) -> ()){
        for i in 0...25{
            foodRef.child("\(i)").observe(.childAdded, with: { (snapshot) -> Void in
                let dictionary = snapshot.value as? NSDictionary
                let Name = dictionary?["Food Name"] as? String ?? ""
                let Protein = dictionary?["Protein (g)"] as? NSNumber
                let Survey = dictionary?["Survey flag"] as? String ?? ""
                let Calcium = dictionary?["Calcium (Ca) (mg)"] as? NSNumber
                let fat = dictionary?["Total fat (g)"] as? NSNumber
                let Sodium = dictionary?["Sodium (Na) (mg)"] as? NSNumber
                let C = dictionary?["Vitamin C (mg)"] as? NSNumber
                let A = dictionary?["Vitamin A retinol equivalents (µg)"] as? NSNumber
                let food = FoodObject(name: Name, protein: Protein!, surveyFlag: Survey, calcium: Calcium!, totalFat: fat!, sodium: Sodium!, vitaminC: C!, vitaminA: A!)
                completion(food)
            })
        }
    }
    func fetchAllFoodNutrient(completion: @escaping ([ExpandableNames]) -> ()){
        var fixedDimensionalArray = [ExpandableNames]()
        for _ in 0...25{
            fixedDimensionalArray.append(ExpandableNames(isExpanded: true, names: [FoodObject]()))
        }
        fetchFoodNutrient(completion:{food,i in
            fixedDimensionalArray[i].names.append(food)
            fixedDimensionalArray[i].isExpanded = true
            completion(fixedDimensionalArray)
        })
    }
    func fetchAllFoodNutrientExtra(completion: @escaping ([FoodObject]) -> ()){
        var fixedDimensionalArrayJoined = [FoodObject]()
        
        fetchFoodNutrientExtra(completion:{food in
            fixedDimensionalArrayJoined.append(food)
            if fixedDimensionalArrayJoined.count == self.numOfFood{
                completion(fixedDimensionalArrayJoined)
            }
            
        })
    }
    func fetchPersonGroupStandard(completion: @escaping (AveragePersonGroupObject) -> ()){
        personGroupStandardRef.observe(.childAdded, with: { (snapshot) -> Void in
            let dictionary = snapshot.value as? NSDictionary
            let ageLower = dictionary?["Age  lower"] as? NSNumber
            let ageUpper = dictionary?["Age  upper"] as? NSNumber
            let gender = dictionary?["Gender"] as? String ?? ""
            let weight = dictionary?["Weight"] as? NSNumber
            let protein = dictionary?["Protein (g)"] as? NSNumber
            let strCalcium = dictionary?["Calcium (Ca) (mg)"] as? String ?? ""
            let calcium = NSNumber(value:Double(strCalcium.replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range: nil) )!)
            
            let totalFat = dictionary?["Total fat (g)"] as? NSNumber
            let sodium = dictionary?["Sodium (Na) (mg)"] as? NSNumber
            let vitaminC = dictionary?["Vitamin C (mg)"] as? NSNumber
            
            let strVitaminA = dictionary?["Vitamin A retinol equivalents (µg)"] as? String ?? ""
            let vitaminA = NSNumber(value:Double(strVitaminA.replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range: nil) )!)
//            let vitaminA = NSNumber(value:Double(dictionary?["Vitamin A retinol equivalents (µg)"] as? String ?? "")! )
            
            let personGroup = AveragePersonGroupObject(ageLower: ageLower!, ageUpper: ageUpper!, gender: gender,weight: weight!,protein: protein!,calcium: calcium,totalFat: totalFat!,sodium: sodium!,vitaminC: vitaminC!,vitaminA: vitaminA)
            completion(personGroup)
        })
    }
    
    func fetchAllPersonGroupStandard(completion: @escaping ([AveragePersonGroupObject]) -> ()){
        var personGroupList = [AveragePersonGroupObject]()
        fetchPersonGroupStandard(completion:{personGroup in
            personGroupList.append(personGroup)
            if(personGroupList.count == self.numOfPersonGroup){
                completion(personGroupList)
            }
        })
    }
    
    func fetchUser(completion: @escaping (UserBasicInfoObject) -> ()){
        userRef.observe(.childAdded, with: { (snapshot) -> Void in
            let dictionary = snapshot.value as? [String:AnyObject]
            let StrAge = dictionary?["Age"] as? String ?? ""
            let gender = dictionary?["Gender"] as? String ?? ""
            let StrWeight = dictionary?["Weight"] as? String ?? ""
            var user: UserBasicInfoObject?
            if let DoubleAge = Double(StrAge), let DoubleWeight = Double(StrWeight){
                let age = NSNumber(value: DoubleAge)
                let weight = NSNumber(value: DoubleWeight)
                user = UserBasicInfoObject(age: age, gender: gender, weight: weight)
                completion(user!)
            }
        })
        userRef.observe(.childChanged, with: { (snapshot) -> Void in
            let dictionary = snapshot.value as? [String:AnyObject]
            let StrAge = dictionary?["Age"] as? String ?? ""
            let gender = dictionary?["Gender"] as? String ?? ""
            let StrWeight = dictionary?["Weight"] as? String ?? ""
            var user: UserBasicInfoObject?
            if let DoubleAge = Double(StrAge), let DoubleWeight = Double(StrWeight){
                let age = NSNumber(value: DoubleAge)
                let weight = NSNumber(value: DoubleWeight)
                user = UserBasicInfoObject(age: age, gender: gender, weight: weight)
                completion(user!)

            }
        })
    }
    
    
    
    
    
    
}

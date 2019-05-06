//
//  MealPlanResultController.swift
//  VicDiet
//
//  Created by Ming Yang on 4/5/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit
import Firebase

class MealPlanResultController: UIViewController {
    
    var homePageController: HomePageController?
    var foodDatabaseArray = [FoodObject]()
    var filteredFoodDatabaseArray = [FoodObject]()
    
    var intakeRestProgressObject = IntakeProgressObject(proteinProgress: 0, calciumProgress: 0, totalFatProgress: 0, sodiumProgress: 0, vitaminCProgress: 0, vitaminAProgress: 0, progressMark: 0)
    var intakeProgressAfterSearch = IntakeProgressObject(proteinProgress: 0, calciumProgress: 0, totalFatProgress: 0, sodiumProgress: 0, vitaminCProgress: 0, vitaminAProgress: 0, progressMark: 0)
    var mealPlanArray = [FoodObject]()
    
    
    var mealPlanOverviewView = MealPlanOverviewView()
    var planResultView = PlanResultView()
    
    
    
    let navigationTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.text = "Auto Meal Planner"
        label.font =  UIFont.boldSystemFont(ofSize: 18)
        label.backgroundColor = .clear
        label.textAlignment = .center
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    
    
    
    let searchMealButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Search New Meal", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.addTarget(self, action: #selector(handleSearchMeal), for: .touchUpInside)
        
        return button
    }()
    let addAsMealButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add This Meal", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.addTarget(self, action: #selector(handleAddAsMeal), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
        setupBottomMenu()
        
        Service.sharedInstance.fetchAllFoodNutrientExtra { (foodDatabaseArray) in
            self.foodDatabaseArray = foodDatabaseArray
            //self.planResultView.foodDatabaseArray = foodDatabaseArray
            self.planResultView.mealPlanResultController = self
            self.planResultView.homePageController = self.homePageController 
            //self.planResultView.tableView.reloadData()
            
            print("Downloading Data Finished!")
            
        }
    }
    
    func setupNavigationBar(){
        
        self.navigationItem.hidesBackButton = true
        let backImage = UIImage(named: "icon_back")?.withRenderingMode((.alwaysOriginal))
        let backBarButtonItem = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(handleBack))
        navigationItem.leftBarButtonItem = backBarButtonItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 125/255, green: 206/255, blue: 148/255, alpha: 1)
        
        navigationTitleLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width*1/3, height: self.navigationController?.navigationBar.frame.height ?? 20)
        navigationItem.titleView = navigationTitleLabel
    }
    
    @objc func handleBack(){
        NotificationCenter.default.post(name: NSNotification.Name("reloadHomePageData"), object: nil)
        self.navigationController?.popViewController(animated: true)
    }
    func setupView(){
        view.backgroundColor = .white
        
        view.addSubview(mealPlanOverviewView)
        mealPlanOverviewView.translatesAutoresizingMaskIntoConstraints = false
        mealPlanOverviewView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height*0.025+64).isActive = true
        print(view.frame.height*0.05)
        mealPlanOverviewView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        mealPlanOverviewView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        mealPlanOverviewView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        
        view.addSubview(planResultView)
        planResultView.translatesAutoresizingMaskIntoConstraints = false
        planResultView.topAnchor.constraint(equalTo: mealPlanOverviewView.bottomAnchor, constant: view.frame.height*0.02).isActive = true
        planResultView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        planResultView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        planResultView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        
    }

    func setupBottomMenu(){
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [searchMealButton,addAsMealButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
            ])
    }
    
    func isFoodWanted(foodNotDecided: FoodObject,intakeProgressRestObject: IntakeProgressObject ) -> (Bool){
        let booleanResult = foodNotDecided.protein.doubleValue <= intakeProgressRestObject.proteinProgress
            && foodNotDecided.calcium.doubleValue <= intakeProgressRestObject.calciumProgress
            && foodNotDecided.totalFat.doubleValue <= intakeProgressRestObject.totalFatProgress
            && foodNotDecided.sodium.doubleValue <= intakeProgressRestObject.sodiumProgress
            && foodNotDecided.vitaminC.doubleValue <= intakeProgressRestObject.vitaminCProgress
            && foodNotDecided.vitaminA.doubleValue <= intakeProgressRestObject.vitaminAProgress
        return booleanResult
    }
    func canNotSearch(foodArray: [FoodObject], restProgress: IntakeProgressObject) -> (Bool){
        if foodArray.count == 0{
            return true
        }
        for item in foodArray{
            if isFoodWanted(foodNotDecided: item, intakeProgressRestObject: restProgress){
                return false
            }
        }
        return true
    }
    func foodIndexGenerator(restProgress: IntakeProgressObject, foodArray: [FoodObject])->(Int){
        var index = Int(0)
        var average = Double(0)
        for i in 0...foodArray.count - 1{
            if foodArray[i].protein.doubleValue <= restProgress.proteinProgress
                && foodArray[i].calcium.doubleValue <= restProgress.calciumProgress
                && foodArray[i].totalFat.doubleValue <= restProgress.totalFatProgress
                && foodArray[i].sodium.doubleValue <= restProgress.sodiumProgress
                && foodArray[i].vitaminC.doubleValue <= restProgress.vitaminCProgress
                && foodArray[i].vitaminA.doubleValue <= restProgress.vitaminAProgress{
                let proteinPercent =
                    Double(truncating: foodArray[i].protein)/restProgress.proteinProgress
                let calciumPercent =
                    Double(truncating: foodArray[i].calcium)/restProgress.calciumProgress
                let totalFatPercent =
                    Double(truncating: foodArray[i].totalFat)/restProgress.totalFatProgress
                let sodiumPercent =
                    Double(truncating: foodArray[i].sodium)/restProgress.sodiumProgress
                let CPercent =
                    Double(truncating: foodArray[i].vitaminC)/restProgress.vitaminCProgress
                let APercent =
                    Double(truncating: foodArray[i].vitaminA)/restProgress.vitaminAProgress
                let averageOfThis = proteinPercent + calciumPercent + totalFatPercent
                    + sodiumPercent + CPercent + APercent
                if averageOfThis > average{
                    average = averageOfThis
                    index = i
                }
            }
        }
        return index
    }
    func updateRestProgress(restProgress:IntakeProgressObject,fooditem: FoodObject) -> (IntakeProgressObject){
        restProgress.proteinProgress = restProgress.proteinProgress
            - Double(truncating:fooditem.protein)
        restProgress.calciumProgress = restProgress.calciumProgress
            - Double(truncating:fooditem.calcium)
        restProgress.totalFatProgress = restProgress.totalFatProgress
            - Double(truncating:fooditem.totalFat)
        restProgress.sodiumProgress = restProgress.sodiumProgress
            - Double(truncating:fooditem.sodium)
        restProgress.vitaminCProgress = restProgress.vitaminCProgress
            - Double(truncating:fooditem.vitaminC)
        restProgress.vitaminAProgress = restProgress.vitaminAProgress
            - Double(truncating:fooditem.vitaminA)
        
        return restProgress
    }
    
    func updateIntakeProgressAfterSearch(){
        for item in self.mealPlanArray{
            intakeProgressAfterSearch.proteinProgress = intakeProgressAfterSearch.proteinProgress
                + Double(truncating: item.protein)
            intakeProgressAfterSearch.calciumProgress = Double(truncating: item.calcium)
                + intakeProgressAfterSearch.calciumProgress
            intakeProgressAfterSearch.totalFatProgress = intakeProgressAfterSearch.totalFatProgress
                + Double(truncating: item.totalFat)
            intakeProgressAfterSearch.sodiumProgress = intakeProgressAfterSearch.sodiumProgress + Double(truncating: item.sodium)
            intakeProgressAfterSearch.vitaminCProgress = intakeProgressAfterSearch.vitaminCProgress
                + Double(truncating: item.vitaminC)
            intakeProgressAfterSearch.vitaminAProgress = intakeProgressAfterSearch.vitaminAProgress
                + Double(truncating: item.vitaminA)
        }
        
    }
    
    @objc private func handleSearchMeal(){
        self.intakeProgressAfterSearch = IntakeProgressObject(proteinProgress: 0, calciumProgress: 0, totalFatProgress: 0, sodiumProgress: 0, vitaminCProgress: 0, vitaminAProgress: 0, progressMark: 0)
        if foodDatabaseArray.count == 0{
            return
        }
        filteredFoodDatabaseArray = foodDatabaseArray
        var restProgress = intakeRestProgressObject
        var numOfFood = Int(0)
        var loopTimes = Int(0)
        while true{
            
            let canNot = canNotSearch(foodArray: filteredFoodDatabaseArray, restProgress: restProgress)
            if canNot{
                break
            }
            let index = foodIndexGenerator(restProgress: restProgress, foodArray: filteredFoodDatabaseArray)
            let wantIt = isFoodWanted(foodNotDecided: filteredFoodDatabaseArray[index], intakeProgressRestObject: restProgress)
            if wantIt{
                mealPlanArray.append(filteredFoodDatabaseArray[index])
                restProgress = updateRestProgress(restProgress: restProgress, fooditem: filteredFoodDatabaseArray[index])
                numOfFood = numOfFood + 1
            }else{
                filteredFoodDatabaseArray.remove(at: index)
            }
            loopTimes = loopTimes + 1
            if loopTimes >= 500 || numOfFood >= 10{
                break
            }
        }
        self.planResultView.mealPlanArray = self.mealPlanArray
        self.planResultView.tableView.reloadData()
        updateIntakeProgressAfterSearch()
        mealPlanOverviewView.setupData(protein: Double(Int(intakeProgressAfterSearch.proteinProgress*1000))*0.001, calcium: Double(Int(intakeProgressAfterSearch.calciumProgress*1000))*0.001, fat: Double(Int(intakeProgressAfterSearch.totalFatProgress*1000))*0.001, sodium: Double(Int(intakeProgressAfterSearch.sodiumProgress*1000))*0.001, vitaminC:Double(Int(intakeProgressAfterSearch.vitaminCProgress*1000))*0.001, vitaminA:Double(Int(intakeProgressAfterSearch.vitaminAProgress*1000))*0.001)
    }
    @objc private func handleAddAsMeal(){
        
        
        
    }
}

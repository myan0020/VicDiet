//
//  GuidanceLauncher.swift
//  VicDiet
//
//  Created by Ming Yang on 7/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class AddTabLauncher: NSObject{
    
    weak var navigationController: UINavigationController?
    var homePageController: HomePageController?
    var mainMenuBar: MainMenuBar?
    let blackView = UIView()
    var addFoodSpliteCenter: CGPoint?
    var addMealSpliteCenter: CGPoint?
    var addSubstituteSpliteCenter: CGPoint?
    var autoMealPlannerSpliteCenter: CGPoint?
    
    var addFoodGuideView: AddFoodGuideView?
    var addMealGuideView: AddMealGuideView?
    var addSubstituteGuideView: AddSubstituteGuideView?
    var mealPlannerGuideView: MealPlannerGuideView?
    
    let addButton: UIButton = {
        let addImageClicked = UIImage(named: "icon_add_clicked")
        let button = UIButton(type: UIButton.ButtonType.custom) as UIButton
        button.setImage(addImageClicked, for: .normal)
        return button
    }()
    
    let addFoodButton: UIButton = {
        
        let button = UIButton(type: UIButton.ButtonType.custom) as UIButton
        //button.setTitle("Food Items", for: .normal)
        button.setImage(UIImage(named: "icon_addFood"), for: .normal)
        //button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    let addMealButton: UIButton = {
        
        let button = UIButton(type: UIButton.ButtonType.custom) as UIButton
        //button.setTitle("Meal Intakes", for: .normal)
        //button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //button.setTitleColor(.white, for: .normal)
        button.setImage(UIImage(named: "icon_addMeal"), for: .normal)
        return button
    }()
    
    let addSubstituteButton: UIButton = {
        
        let button = UIButton(type: UIButton.ButtonType.custom) as UIButton
        //button.setTitle("Substitute", for: .normal)
        button.setImage(UIImage(named: "icon_substitute"), for: .normal)
        //button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    let autoMealPlannerButton: UIButton = {
        
        let button = UIButton(type: UIButton.ButtonType.custom) as UIButton
        //button.setTitle("AutoMealPlanner", for: .normal)
        //button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //button.setTitleColor(.white, for: .normal)
        button.setImage(UIImage(named: "icon_autoMealPlanner"), for: .normal)
        return button
    }()
    
    override init() {
        super.init()
        
    }

    @objc func showLauncher(){
        if let window = UIApplication.shared.keyWindow{
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismissAddTabLauncher)))
            addButton.addTarget(self, action: #selector(handleDismissAddTabLauncher), for: .touchUpInside)
            
            addFoodSpliteCenter = CGPoint(x: window.frame.width/2 - 90, y: window.frame.height - 100)
            addMealSpliteCenter = CGPoint(x: window.frame.width/2 + 90, y: window.frame.height - 100)
            addSubstituteSpliteCenter = CGPoint(x: window.frame.width/2, y: window.frame.height - 100)
            autoMealPlannerSpliteCenter = CGPoint(x: window.frame.width/2, y: window.frame.height - 200)
                
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            window.addSubview(blackView)
            blackView.addSubview(addButton)
            blackView.addSubview(addFoodButton)
            blackView.addSubview(addMealButton)
            blackView.addSubview(addSubstituteButton)
            blackView.addSubview(autoMealPlannerButton)
            
            addButton.frame.size = CGSize(width: 50, height: 46)
            addButton.center = CGPoint(x: window.frame.width/2, y: window.frame.height - 55/2)
            addFoodButton.frame.size = CGSize(width: 90, height: 90)
            addFoodButton.center = addButton.center
            addMealButton.frame.size = CGSize(width: 90, height: 90)
            addMealButton.center = addButton.center
            addSubstituteButton.frame.size = CGSize(width: 90, height: 90)
            addSubstituteButton.center = addButton.center
            autoMealPlannerButton.frame.size = CGSize(width: 90, height: 90)
            autoMealPlannerButton.center = addButton.center
            
            blackView.frame = window.frame
            blackView.alpha = 0
            UIView.animate(withDuration: 0.1, animations: {
                self.blackView.alpha = 1
                self.addButton.alpha = 1
                self.addFoodButton.alpha = 0
                self.addMealButton.alpha = 0
                self.addSubstituteButton.alpha = 0
                self.autoMealPlannerButton.alpha = 0
            })
            UIView.animate(withDuration: 0.3, animations: {
                self.addFoodButton.alpha = 1
                self.addMealButton.alpha = 1
                self.addSubstituteButton.alpha = 1
                self.autoMealPlannerButton.alpha = 1
                self.addFoodButton.center = self.addFoodSpliteCenter!
                self.addMealButton.center = self.addMealSpliteCenter!
                self.addSubstituteButton.center = self.addSubstituteSpliteCenter!
                self.autoMealPlannerButton.center = self.autoMealPlannerSpliteCenter!
            })
            addFoodButton.addTarget(self, action: #selector(handleAddFoodInLauncher), for: .touchUpInside)
            addMealButton.addTarget(self, action: #selector(handleAddMealInLauncher), for: .touchUpInside)
            addSubstituteButton.addTarget(self, action: #selector(handleAddSubstituteInLauncher), for: .touchUpInside)
            autoMealPlannerButton.addTarget(self, action: #selector(handleAutoMealPlannerInLauncher), for: .touchUpInside)
            
            
            
            if homePageController?.addButtonFirstClick == [0,0,0,0]{
                
                self.addFoodGuideView = AddFoodGuideView(frame: blackView.frame)
                blackView.addSubview(self.addFoodGuideView!)
        
                self.addFoodGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismissAddFoodGuide)))
                self.addFoodGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
                UIView.animate(withDuration: 0.5, animations: {
                    self.addFoodGuideView!.alpha = 1
                    
                })
                
            }
            
            
        }
    }

    @objc func handleDismissAddFoodGuide(){
        UIView.animate(withDuration: 0.2, animations: {
            self.addFoodGuideView?.alpha = 0
            
            self.addMealGuideView = AddMealGuideView(frame: (UIApplication.shared.keyWindow?.frame)!)
            self.blackView.addSubview(self.addMealGuideView!)
            
            self.addMealGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismissAddMealGuide)))
            self.addMealGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
            UIView.animate(withDuration: 0.5, animations: {self.addMealGuideView!.alpha = 1})
            
        })
    }
    @objc func handleDismissAddMealGuide(){
        UIView.animate(withDuration: 0.2, animations: {
            self.addMealGuideView?.alpha = 0
            
            self.addSubstituteGuideView = AddSubstituteGuideView(frame: (UIApplication.shared.keyWindow?.frame)!)
            self.blackView.addSubview(self.addSubstituteGuideView!)

            self.addSubstituteGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismissAddSubstituteGuide)))
            self.addSubstituteGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
            UIView.animate(withDuration: 0.5, animations: {self.addSubstituteGuideView!.alpha = 1})
            
        })
    }
    @objc func handleDismissAddSubstituteGuide(){
        UIView.animate(withDuration: 0.2, animations: {
            self.addSubstituteGuideView?.alpha = 0
            
            self.mealPlannerGuideView = MealPlannerGuideView(frame: (UIApplication.shared.keyWindow?.frame)!)
            self.blackView.addSubview(self.mealPlannerGuideView!)
            
            self.mealPlannerGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismissMealPlannerGuide)))
            self.mealPlannerGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
            UIView.animate(withDuration: 0.5, animations: {self.mealPlannerGuideView!.alpha = 1})
            
        })
    }
    @objc func handleDismissMealPlannerGuide(){
        UIView.animate(withDuration: 0.2, animations: {
            self.mealPlannerGuideView?.alpha = 0
            
        })
    }
    
    @objc func handleDismiss(){
        self.addFoodGuideView?.alpha = 0
        self.addMealGuideView?.alpha = 0
        self.addSubstituteGuideView?.alpha = 0
        self.mealPlannerGuideView?.alpha = 0
    }
    
    @objc func handleAddFoodInLauncher(){
        self.blackView.alpha = 0
        let searchingViewController = SearchingViewController()
        searchingViewController.homePageController = self.homePageController
        let oldNavigationController = self.navigationController
        oldNavigationController?.pushViewController(searchingViewController, animated: true)
    }
    
    @objc func handleAddMealInLauncher(){
        self.blackView.alpha = 0
        let mealListController = MealListController()
        mealListController.homePageController = self.homePageController
        mealListController.mealObjectList = (self.homePageController?.mealObjectList)!
        let oldNavigationController = self.navigationController
        oldNavigationController?.pushViewController(mealListController, animated: true)
    }
    @objc func handleAddSubstituteInLauncher(){
        self.blackView.alpha = 0
        let substituteZeroController = SubstituteZeroController()
        substituteZeroController.homePageController = self.homePageController
        let oldNavigationController = self.navigationController
        oldNavigationController?.pushViewController(substituteZeroController, animated: true)
    }
    @objc func handleAutoMealPlannerInLauncher(){
        self.blackView.alpha = 0
        let mealPlanResultController = MealPlanResultController()
        mealPlanResultController.homePageController = self.homePageController
        mealPlanResultController.intakeRestProgressObject = (self.homePageController?.intakeRestProgressObject)!
        let oldNavigationController = self.navigationController
        oldNavigationController?.pushViewController(mealPlanResultController, animated: true)
    }
    
    @objc func handleDismissAddTabLauncher(){
        UIView.animate(withDuration: 0.3, animations: {
            self.addFoodButton.center = self.addButton.center
            self.addMealButton.center = self.addButton.center
            self.addSubstituteButton.center = self.addButton.center
            self.autoMealPlannerButton.center = self.addButton.center
            UIView.animate(withDuration: 0.1, animations: {
                self.addFoodButton.alpha = 0
                self.addMealButton.alpha = 0
                self.addSubstituteButton.alpha = 0
                self.autoMealPlannerButton.alpha = 0
                self.addButton.alpha = 0
                self.blackView.alpha = 0
            })
        })
    }
    
}

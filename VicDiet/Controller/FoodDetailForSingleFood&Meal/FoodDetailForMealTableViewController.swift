//
//  FoodDetailTableViewController.swift
//  VicDiet
//
//  Created by Ming Yang on 26/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class FoodDetailForMealTableViewController: UITableViewController{


    
    var searchForMealViewController: SearchForMealViewController?
    var homePageController: HomePageController?
    var detailList = [String]()
    var selectedFoodObject: FoodObject?
    var fixedDimensionalArray = [ExpandableNames]()
    var detailTitle = ["Food Name","Detail","Protein (g)","Calcium (Ca) (mg)","Total fat (g)","Sodium (Na) (mg)","Vitamin C (mg)","Vitamin A retinol equivalents (µg)"]

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.separatorStyle = .none
        self.navigationItem.hidesBackButton = true
        setupBackBarButtons()
        setupConfirmBarButtons()
        
        tableView.register(FoodNameCell.self, forCellReuseIdentifier: "FoodNameCell")
        tableView.register(FoodDetailCell.self, forCellReuseIdentifier: "FoodDetailCell")
        tableView.register(FoodQuantityCell.self, forCellReuseIdentifier: "FoodQuantityCell")
        tableView.register(FoodEveryDayIntakePercentageCell.self, forCellReuseIdentifier: "FoodEveryDayIntakePercentageCell")
        

        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        if section == 1{
            return 1
        }
        if section == 2{
            return 1
        }else {
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FoodNameCell", for: indexPath) as! FoodNameCell
            cell.foodNameLabel.text = detailList[0]
            return cell
        }
        if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FoodDetailCell", for: indexPath) as! FoodDetailCell
            cell.foodDetailLabel.text = detailList[1]
            return cell
        }
        if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FoodQuantityCell", for: indexPath) as! FoodQuantityCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FoodEveryDayIntakePercentageCell", for: indexPath) as! FoodEveryDayIntakePercentageCell
            cell.foodDetailForMealTableViewController = self
            cell.homePageController = self.homePageController
            
            
           
            return cell
        }
    }

    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
//        if section == 0{
//            let header = FoodDetailTitleView()
//            header.titleLabel.text = "Description"
//            return header
//        }
        if section == 1{
            let header = FoodDetailTitleView()
            header.titleLabel.text = "Detail"
            return header
        }
        if section == 2{
            let header = FoodDetailTitleView()
            header.titleLabel.text = "Quantity"
            return header
        }
        if section == 3{
            let header = FoodDetailTitleView()
            header.titleLabel.text = "Everyday Intake Percentage"
            return header
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 0{
//            return self.view.frame.height*0.1
//        }
        if section == 1{
            return self.view.frame.height*0.15
        }
        if section == 2{
            return self.view.frame.height*0.15
        }
        if section == 3{
            return self.view.frame.height*0.15
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return self.view.frame.height*0.2
        }
        if indexPath.section == 1{
            return self.view.frame.height*0.1
        }
        if indexPath.section == 2{
            return self.view.frame.height*0.2
        }else {
            return self.view.frame.height*0.3
        }
    }
    
    
    func setupBackBarButtons(){
        let backImage = UIImage(named: "icon_back")?.withRenderingMode((.alwaysOriginal))
        let backBarButtonItem = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(handleBack))
        navigationItem.leftBarButtonItem = backBarButtonItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 125/255, green: 206/255, blue: 148/255, alpha: 1)
    }
    func setupConfirmBarButtons(){
        
        let confirmImage = UIImage(named: "icon_confirm")?.withRenderingMode((.alwaysOriginal))
        let confirmBarButtonItem = UIBarButtonItem(image: confirmImage, style: .plain, target: self, action: #selector(handleAddFood))
        navigationItem.rightBarButtonItem = confirmBarButtonItem
        navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 125/255, green: 206/255, blue: 148/255, alpha: 1)
    }
    @objc func handleBack(){
        self.navigationController?.popViewController(animated: true)
    }
    @objc func handleAddFood(){
        let indexPath = NSIndexPath(row: 0, section: 2) as IndexPath
        let cell = tableView.cellForRow(at: indexPath) as! FoodQuantityCell
        let multipler = Double(cell.inputTextField.text!)
        if multipler != nil{
            self.selectedFoodObject?.setWithMultipler(multipler: multipler!)
        }else{
            self.selectedFoodObject?.setWithMultipler(multipler: 0)
        }
        self.searchForMealViewController?.mealObject.foodObjectList.append(selectedFoodObject!)
        self.navigationController?.popViewController(animated: true)
    }
    
}

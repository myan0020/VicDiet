//
//  SearchForMealViewController.swift
//  VicDiet
//
//  Created by Ming Yang on 18/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//


import UIKit
import StepIndicator

class SubstituteForthController: UIViewController{
    
    
    
    var homePageController: HomePageController?
    var fixedDimensionalArray = [ExpandableNames]()
    var selectedOldFoodObject: FoodObject?
    var fixedDimensionalArrayJoined = [FoodObject]()
    var fixedDimensionalArrayJoinedNew = [FoodObject]()
    var indexArray = [Int]()
    
    let sv = SubstituteResultSearchView()
    var newFoodQuantity: Double = 0
    var oldFoodQuantity: Double = 0
    var index: Double?
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Back", for: .normal)
        //button.setTitleColor(UIColor(red: 125/255, green: 206/255, blue: 148/255, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        
        return button
    }()
    
    let navigationTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.text = "Substitute"
        label.font =  UIFont.boldSystemFont(ofSize: 18)
        label.backgroundColor = .clear
        label.textAlignment = .center
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.text = "Matching complete !"
        label.font =  UIFont.boldSystemFont(ofSize: 18)
        label.backgroundColor = .clear
        label.textAlignment = .center
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    let stepIndicatorView: StepIndicatorView = {
        let stepIndicator = StepIndicatorView()
        stepIndicator.numberOfSteps = 6
        stepIndicator.currentStep = 4
        stepIndicator.backgroundColor = .white
        return stepIndicator
    }()
    
    let realSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Click To Search"
        searchBar.barTintColor = .white
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor.white.cgColor
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            textfield.textColor = UIColor.black
            textfield.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        }
        return searchBar
    }()

    func markCalculator(oldFoodItem: FoodObject, newFoodItem: FoodObject) -> (FoodObject){
        
        let proteinDistance = Double(abs(Int((oldFoodItem.protein.doubleValue)*1000) - Int(newFoodItem.protein.doubleValue*1000)))/1000
        let calciumDistance = Double(abs(Int((oldFoodItem.calcium.doubleValue)*1000) - Int(newFoodItem.calcium.doubleValue*1000)))/1000
        let totalFatDistance = Double(abs(Int((oldFoodItem.totalFat.doubleValue)*1000) - Int(newFoodItem.totalFat.doubleValue*1000)))/1000
        let sodiumDistance = Double(abs(Int((oldFoodItem.sodium.doubleValue)*1000) - Int(newFoodItem.sodium.doubleValue*1000)))/1000
        let vitaminCDistance = Double(abs(Int((oldFoodItem.vitaminC.doubleValue)*1000) - Int(newFoodItem.vitaminC.doubleValue*1000)))/1000
        let vitaminADistance = Double(abs(Int((oldFoodItem.vitaminA.doubleValue)*1000) - Int(newFoodItem.vitaminA.doubleValue*1000)))/1000
        newFoodItem.mark = proteinDistance + calciumDistance + totalFatDistance + sodiumDistance + vitaminCDistance + vitaminADistance
        return newFoodItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Service.sharedInstance.fetchAllFoodNutrientExtra { (fixedDimensionalArrayJoined) in
            self.fixedDimensionalArrayJoined = fixedDimensionalArrayJoined
            
            self.selectedOldFoodObject?.setWithMultipler(multipler: self.oldFoodQuantity)
            let selectedItem = self.selectedOldFoodObject
            self.sv.selectedOldFoodObject = self.selectedOldFoodObject
            
            for i in 0...self.fixedDimensionalArrayJoined.count - 1{
                if self.index == 0{
                    if Int((self.selectedOldFoodObject?.protein.doubleValue)!*1000) >= Int(self.fixedDimensionalArrayJoined[i].protein.doubleValue*self.newFoodQuantity*1000){
                        self.indexArray.append(i)
                        self.fixedDimensionalArrayJoined[i] = self.markCalculator(oldFoodItem: (selectedItem)!, newFoodItem: self.fixedDimensionalArrayJoined[i])
                    }
                }
                if self.index == 1{
                    if Int((self.selectedOldFoodObject?.calcium.doubleValue)!*1000) >= Int(self.fixedDimensionalArrayJoined[i].calcium.doubleValue*self.newFoodQuantity*1000){
                        self.indexArray.append(i)
                        self.fixedDimensionalArrayJoined[i] = self.markCalculator(oldFoodItem: (selectedItem)!, newFoodItem: self.fixedDimensionalArrayJoined[i])
                    }
                }
                if self.index == 2{
                    if Int((self.selectedOldFoodObject?.totalFat.doubleValue)!*1000) >= Int(self.fixedDimensionalArrayJoined[i].totalFat.doubleValue*self.newFoodQuantity*1000){
                        self.indexArray.append(i)
                        self.fixedDimensionalArrayJoined[i] = self.markCalculator(oldFoodItem: (selectedItem)!, newFoodItem: self.fixedDimensionalArrayJoined[i])
                    }
                }
                if self.index == 3{
                    if Int((self.selectedOldFoodObject?.sodium.doubleValue)!*1000) >= Int(self.fixedDimensionalArrayJoined[i].sodium.doubleValue*self.newFoodQuantity*1000){
                        self.indexArray.append(i)
                        self.fixedDimensionalArrayJoined[i] = self.markCalculator(oldFoodItem: (selectedItem)!, newFoodItem: self.fixedDimensionalArrayJoined[i])
                    }
                }
                if self.index == 4{
                    if Int((self.selectedOldFoodObject?.vitaminC.doubleValue)!*1000) >= Int(self.fixedDimensionalArrayJoined[i].vitaminC.doubleValue*self.newFoodQuantity*1000){
                        self.indexArray.append(i)
                        self.fixedDimensionalArrayJoined[i] = self.markCalculator(oldFoodItem: (selectedItem)!, newFoodItem: self.fixedDimensionalArrayJoined[i])
                    }
                }
                if self.index == 5{
                    if Int((self.selectedOldFoodObject?.vitaminA.doubleValue)!*1000) >= Int(self.fixedDimensionalArrayJoined[i].vitaminA.doubleValue*self.newFoodQuantity*1000){
                        self.indexArray.append(i)
                        self.fixedDimensionalArrayJoined[i] = self.markCalculator(oldFoodItem: (selectedItem)!, newFoodItem: self.fixedDimensionalArrayJoined[i])
                    }
                }
                
            }
            if self.indexArray.count > 0{
                for i in 0...self.indexArray.count - 1{
                    self.fixedDimensionalArrayJoinedNew.append(self.fixedDimensionalArrayJoined[self.indexArray[i]])
                }
                self.fixedDimensionalArrayJoinedNew.sort(by: {$0.mark < $1.mark})
                //fixedDimensionalArrayJoinedNew.remove(at: 0)
                if self.fixedDimensionalArrayJoinedNew[0].name == selectedItem?.name && self.fixedDimensionalArrayJoinedNew[0].surveyFlag == selectedItem?.surveyFlag{
                    self.fixedDimensionalArrayJoinedNew.remove(at: 0)
                }
            }else{
                
            }
            
            
            self.sv.fixedDimensionalArrayJoinedNew = self.fixedDimensionalArrayJoinedNew
            //sv.selectedOldFoodObject = selectedOldFoodObject
            self.sv.newFoodQuantity = self.newFoodQuantity
            self.sv.substituteForthController = self
            self.sv.homePageController = self.homePageController
            self.sv.tableView.reloadData()
            
        }
        
        
//        for i in 0...25{
//            if fixedDimensionalArray[i].names.count > 0{
//                for j in 0...fixedDimensionalArray[i].names.count - 1{
////                    fixedDimensionalArray[i].names[j].setWithMultipler(multipler: newFoodQuantity)
//                    fixedDimensionalArrayJoined.append(fixedDimensionalArray[i].names[j])
//                }
//            }
//        }
        
        setupNavigationBar()
        setupView()
        
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
        self.navigationController?.popViewController(animated: true)
    }
    func setupView(){
        view.backgroundColor = .white
        
        self.subTitleLabel.frame = CGRect(x: self.view.frame.width*0.1, y: 64, width: self.view.frame.width*0.8, height: self.view.frame.height*0.1)
        view.addSubview(subTitleLabel)
        
        self.stepIndicatorView.frame = CGRect(x: self.view.frame.width*0.1, y: self.view.frame.height*0.1 + 64, width: self.view.frame.width*0.8, height: self.view.frame.height*0.1)
        self.view.addSubview(self.stepIndicatorView)
        
        view.addSubview(stepIndicatorView)
        view.addSubview(realSearchBar)
        view.addSubview(sv)
        
        realSearchBar.translatesAutoresizingMaskIntoConstraints = false
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        
        realSearchBar.topAnchor.constraint(equalTo: stepIndicatorView.bottomAnchor, constant: 0).isActive = true
        realSearchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        realSearchBar.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        realSearchBar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        realSearchBar.delegate = self
        
        sv.backgroundColor = .yellow
        sv.topAnchor.constraint(equalTo: realSearchBar.bottomAnchor, constant: 0).isActive = true
        sv.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        sv.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        sv.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
}


extension SubstituteForthController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar){
        if (searchBar.text == ""){
            return
        }
        sv.isSearching = true
        sv.tableView.separatorStyle = .singleLine
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        //sv.isSearching = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        sv.isSearching = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText == ""){
            sv.isSearching = false
            sv.tableView.separatorStyle = .none
            for i in 0...25{
                self.sv.filteredFixedDimensionalArrayJoinedNew.removeAll(keepingCapacity: false)
                
            }
            self.sv.tableView.reloadData()
            return
        }
        self.sv.filteredFixedDimensionalArrayJoinedNew.removeAll(keepingCapacity: false)
        let predicate = searchBar.text!.lowercased()
        self.sv.filteredFixedDimensionalArrayJoinedNew = self.sv.fixedDimensionalArrayJoinedNew.filter{$0.name.lowercased().contains(predicate)}
        //self.sv.filteredFixedDimensionalArrayJoined.sort(by: {$0.name < $1.name})
        self.sv.isSearching = true
        sv.tableView.separatorStyle = .singleLine
        self.sv.tableView.reloadData()
        
    }
    
}

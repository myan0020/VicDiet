//
//  SearchForMealViewController.swift
//  VicDiet
//
//  Created by Ming Yang on 18/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//


import UIKit
import Firebase
import StepIndicator

class SubstituteFirstController: UIViewController{
    
    
    
    var homePageController: HomePageController?
    var index: Double?
    private let letterArray = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    private let ref = Database.database().reference().child("OpenDataRepository").child("FoodNutrient")
    
    private var dataRefHandle: DatabaseHandle?
    //let uid = Auth.auth().currentUser?.uid
    
    let sv = SubstituteSearchView()
    
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
        label.text = "Which food you want to replace"
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
        stepIndicator.currentStep = 1
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
    
    /*
     Remove all observers when deinitializing
     */
    deinit {
        ref.removeAllObservers()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sv.index = index 
        sv.substituteFirstController = self
        sv.homePageController = self.homePageController
        setupNavigationBar()

        
        
        Service.sharedInstance.fetchAllFoodNutrient { (fixedDimensionalArray) in
            self.sv.fixedDimensionalArray = fixedDimensionalArray
            self.sv.tableView.reloadData()
            
        }
        
      
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


extension SubstituteFirstController: UISearchBarDelegate {
    
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
                self.sv.filteredFixedDimensionalArray[i].names.removeAll(keepingCapacity: false)
                
            }
            self.sv.tableView.reloadData()
            return
        }
        for i in 0...25{
            self.sv.filteredFixedDimensionalArray[i].names.removeAll(keepingCapacity: false)
        }
        let predicate = searchBar.text!.lowercased()
        for i in 0...25{
            self.sv.filteredFixedDimensionalArray[i].names = self.sv.fixedDimensionalArray[i].names.filter{$0.name.lowercased().contains(predicate)}
            self.sv.filteredFixedDimensionalArray[i].names.sort(by: {$0.name < $1.name})
            
        }
        self.sv.isSearching = true
        sv.tableView.separatorStyle = .singleLine
        self.sv.tableView.reloadData()
        
    }
    
}

//
//  SubstituteThirdController.swift
//  VicDiet
//
//  Created by Ming Yang on 2/5/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit
import StepIndicator

class SubstituteThirdController: UITableViewController {

//    var substituteSecondController: SubstituteSecondController?
    var homePageController: HomePageController?
//    var detailList = [String]()
    var selectedOldFoodObject: FoodObject?
    var fixedDimensionalArray = [ExpandableNames]()
    var detailTitle = ["Food Name","Detail","Protein (g)","Calcium (Ca) (mg)","Total fat (g)","Sodium (Na) (mg)","Vitamin C (mg)","Vitamin A retinol equivalents (µg)"]
    var newFoodQuantity: Double = 0
    var oldFoodQuantity: Double = 0
    var index: Double?
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
        label.text = "What is the amount of the new food you want to replace with"
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
        stepIndicator.currentStep = 3
        stepIndicator.backgroundColor = .white
        return stepIndicator
    }()
    let inputTextField: LogInTextField = {
        let textField = LogInTextField()
        textField.keyboardType = .decimalPad
        
        return textField
    }()
    let inputTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.text = "Gram(s)"
        label.font =  UIFont.boldSystemFont(ofSize: 18)
        label.backgroundColor = .clear
        label.textAlignment = .center
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    private let chooseToReplaceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start Matching", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        button.addTarget(self, action: #selector(handleChooseToReplace), for: .touchUpInside)
        
        return button
    }()
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //tableView.contentInset = UIEdgeInsets(top:(self.navigationController?.navigationBar.frame.height)! + 20, left: 0, bottom: 0, right: 0)
        setupNavigationBar()
        setupBottomButton()
        
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId0")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId1")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId2")
        
        tableView.tableFooterView = UIView()
        
        tableView.separatorStyle = .none
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
    
    func setupBottomButton(){
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [chooseToReplaceButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: view.frame.height/11)
            ])
    }
    
    @objc func handleBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func handleChooseToReplace(){
 
        let num = Double(inputTextField.text!)
        if num != nil{
            self.newFoodQuantity = num!/100
        }else{
            self.newFoodQuantity = 0
        }
        let substituteForthController = SubstituteForthController()
        substituteForthController.newFoodQuantity = newFoodQuantity
        substituteForthController.oldFoodQuantity = oldFoodQuantity 
        substituteForthController.index = index 
        substituteForthController.fixedDimensionalArray = fixedDimensionalArray
        
        substituteForthController.selectedOldFoodObject = self.selectedOldFoodObject
        substituteForthController.homePageController = self.homePageController
        let oldNavigationController = self.navigationController
        oldNavigationController?.pushViewController(substituteForthController, animated: true)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 1
        }
        if(section == 1){
            return 1
            
        }else{
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellId0", for: indexPath) as! UITableViewCell
            cell.selectionStyle = .none
            subTitleLabel.frame = CGRect(x: cell.frame.width*0.1, y: 0, width: cell.frame.width*0.8, height: cell.frame.height)
            cell.addSubview(subTitleLabel)
            
            return cell
        }
        if(indexPath.section == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellId1", for: indexPath) as! UITableViewCell
            cell.selectionStyle = .none
            stepIndicatorView.frame = CGRect(x: cell.frame.width*0.1, y: 0, width: cell.frame.width*0.8, height: cell.frame.height)
            cell.addSubview(stepIndicatorView)
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellId2", for: indexPath) as! UITableViewCell
            cell.selectionStyle = .none
            cell.addSubview(inputTextField)
            inputTextField.translatesAutoresizingMaskIntoConstraints = false
            inputTextField.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: -cell.frame.width*0.12).isActive = true
            inputTextField.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
            inputTextField.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 0.5).isActive = true
            inputTextField.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 0.22).isActive = true
            cell.addSubview(inputTextLabel)
            inputTextLabel.translatesAutoresizingMaskIntoConstraints = false
            inputTextLabel.leadingAnchor.constraint(equalTo: inputTextField.trailingAnchor, constant: 5).isActive = true
            inputTextLabel.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
            inputTextLabel.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 0.23).isActive = true
            inputTextLabel.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 0.22).isActive = true
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0){
            return self.view.frame.height*0.1
        }
        if(indexPath.section == 1){
            return self.view.frame.height*0.1
        }else{
            return self.view.frame.height*0.4
        }
    }

}

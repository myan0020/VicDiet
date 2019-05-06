//
//  SubstituteSecondController.swift
//  VicDiet
//
//  Created by Ming Yang on 2/5/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit
import StepIndicator

class SubstituteZeroController: UITableViewController {
    
    var homePageController: HomePageController?
    
    
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
        label.text = "Which nutrient you want to intake less"
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
        stepIndicator.currentStep = 0
        stepIndicator.backgroundColor = .white
        return stepIndicator
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        setupNavigationBar()

        
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId0")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId1")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId20")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId21")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId22")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId23")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId24")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId25")
        
        tableView.tableFooterView = UIView()
        
       
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
    
//    func setupBottomButton(){
//
//        let bottomControlsStackView = UIStackView(arrangedSubviews: [chooseToReplaceButton])
//        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
//        bottomControlsStackView.distribution = .fillEqually
//        view.addSubview(bottomControlsStackView)
//
//        NSLayoutConstraint.activate([
//            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            bottomControlsStackView.heightAnchor.constraint(equalToConstant: view.frame.height/11)
//            ])
//    }
//
    @objc func handleBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
//    @objc private func handleChooseFoodToReplace(){
//        let substituteThirdController = SubstituteThirdController()
//        let num = Double(inputTextField.text!)
//        if num != nil{
//            self.selectedOldFoodObject?.setWithMultipler(multipler: num!/100)
//        }else{
//            self.selectedOldFoodObject?.setWithMultipler(multipler: 0)
//        }
//
//        //        substituteThirdController.detailList = detailList
//        substituteThirdController.fixedDimensionalArray = fixedDimensionalArray
//        substituteThirdController.selectedOldFoodObject = self.selectedOldFoodObject
//        //        substituteThirdController.substituteSecondController = self
//        substituteThirdController.homePageController = self.homePageController
//        //        detailList = [String]()
//        let oldNavigationController = self.navigationController
//        oldNavigationController?.pushViewController(substituteThirdController, animated: true)
//    }
    
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
            return 6
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
            if indexPath.row == 0{
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId20")
                cell.selectionStyle = .none
                cell.textLabel?.text = "Protein Substitute"
                return cell
            }
            if indexPath.row == 1{
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId21")
                cell.selectionStyle = .none
                cell.textLabel?.text = "Calcium Substitute"
                return cell
            }
            if indexPath.row == 2{
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId22")
                cell.selectionStyle = .none
                cell.textLabel?.text = "Fat Substitute"
                return cell
            }
            if indexPath.row == 3{
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId23")
                cell.selectionStyle = .none
                cell.textLabel?.text = "Sodium Substitute"
                return cell
            }
            if indexPath.row == 4{
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId24")
                cell.selectionStyle = .none
                cell.textLabel?.text = "Vitamin C Substitute"
                return cell
            }else{
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId25")
                cell.selectionStyle = .none
                cell.textLabel?.text = "Vitamin A Substitute"
                return cell
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0){
            return self.view.frame.height*0.1
        }
        if(indexPath.section == 1){
            return self.view.frame.height*0.1
        }else{
            return self.view.frame.height*0.11
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2{
            
            let substituteFirstController = SubstituteFirstController()
            substituteFirstController.homePageController = self.homePageController
            substituteFirstController.index = Double(indexPath.row)
            let oldNavigationController = self.navigationController
            oldNavigationController?.pushViewController(substituteFirstController, animated: true)
        }
    }
    
}

//
//  SearchingView.swift
//  VicDiet
//
//  Created by Ming Yang on 6/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit
//import Firebase

class SubstituteSearchView: UIView, UITableViewDelegate, UITableViewDataSource{
    
//    private let ref = Database.database().reference().child("OpenDataRepository").child("FoodNutrient")
    
    var homePageController: HomePageController?
    var substituteFirstController: SubstituteFirstController?
    
    var fixedDimensionalArray = [ExpandableNames]()
    var filteredFixedDimensionalArray = [ExpandableNames]()
    var nonActiveFixedDimensionalArray = [ExpandableNames]()
    var index: Double?
    private let letterArray = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
//    var detailList = [String]()
    
    var isSearching: Bool = false
    
    let cellId = "cellId"
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        return tv
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        for i in 0...25{
            
            fixedDimensionalArray.append(ExpandableNames(isExpanded: true, names: [FoodObject]()))
            filteredFixedDimensionalArray.append(ExpandableNames(isExpanded: true, names: [FoodObject]()))
            nonActiveFixedDimensionalArray.append(ExpandableNames(isExpanded: true, names: [FoodObject]()))
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching{
            if (!filteredFixedDimensionalArray[section].isExpanded){
                return 0
            }
            return filteredFixedDimensionalArray[section].names.count
        }
        
        if (!nonActiveFixedDimensionalArray[section].isExpanded){
            return 0
        }
        return 0
        //return nonActiveFixedDimensionalArray[section].names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as UITableViewCell
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: cellId)
        if isSearching{
            let name = filteredFixedDimensionalArray[indexPath.section].names[indexPath.row].name
            let detail = filteredFixedDimensionalArray[indexPath.section].names[indexPath.row].surveyFlag
            cell.textLabel!.text = name
            cell.detailTextLabel?.text = detail
            
        }
        else{
            
        }
        
        return cell
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if isSearching{
            
            return fixedDimensionalArray.count
        }else{
            
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //let viewWidth = tableView.frame.width
        
        let button = UIButton(type: .system)
        //button.setTitle("Click To Close", for: .normal)
        button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        //button.backgroundColor = UIColor(red: 140/255, green: 235/255, blue: 160/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.contentHorizontalAlignment = .left
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: self.frame.width/10, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        
        button.tag = section
        button.setTitle(letterArray[section], for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
        
    }
    
    
    @objc func handleExpandClose(button: UIButton){
        
        if isSearching{
            
            let section = button.tag
            var indexPaths = [IndexPath]()
            for row in filteredFixedDimensionalArray[section].names.indices {
                let indexPath = IndexPath(row: row, section: section)
                indexPaths.append(indexPath)
            }
            
            let isExpanded = filteredFixedDimensionalArray[section].isExpanded
            filteredFixedDimensionalArray[section].isExpanded = !isExpanded
            
            //button.setTitle(isExpanded ? "Click To Open" : "Click To Close", for: .normal)
            
            if (isExpanded){
                tableView.deleteRows(at: indexPaths, with: .fade)
                
            } else{
                tableView.insertRows(at: indexPaths, with: .fade)
            }
            
        } else{
            
            let section = button.tag
            var indexPaths = [IndexPath]()
            for row in nonActiveFixedDimensionalArray[section].names.indices {
                let indexPath = IndexPath(row: row, section: section)
                indexPaths.append(indexPath)
            }
            
            let isExpanded = nonActiveFixedDimensionalArray[section].isExpanded
            fixedDimensionalArray[section].isExpanded = !isExpanded
            
            //button.setTitle(isExpanded ? "Click To Open" : "Click To Close", for: .normal)
            
            
            if (isExpanded){
                tableView.deleteRows(at: indexPaths, with: .fade)
                
            } else{
                tableView.insertRows(at: indexPaths, with: .fade)
            }
            
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if isSearching{
            if (filteredFixedDimensionalArray[section].names.count == 0){
                return 0
            }
            return 40
        }else{
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if isSearching{
            
//            let name = filteredFixedDimensionalArray[indexPath.section].names[indexPath.row].name
//            let detail = filteredFixedDimensionalArray[indexPath.section].names[indexPath.row].surveyFlag
//            let protein = filteredFixedDimensionalArray[indexPath.section].names[indexPath.row].protein
//            let calcium = filteredFixedDimensionalArray[indexPath.section].names[indexPath.row].calcium
//            let totalFat = filteredFixedDimensionalArray[indexPath.section].names[indexPath.row].totalFat
//            let sodium = filteredFixedDimensionalArray[indexPath.section].names[indexPath.row].sodium
//            let vitaminC = filteredFixedDimensionalArray[indexPath.section].names[indexPath.row].vitaminC
//            let vitaminA = filteredFixedDimensionalArray[indexPath.section].names[indexPath.row].vitaminA
//
//            detailList.append(name)
//            detailList.append(detail)
//            detailList.append("\(protein)")
//            detailList.append("\(calcium)")
//            detailList.append("\(totalFat)")
//            detailList.append("\(sodium)")
//            detailList.append("\(vitaminC)")
//            detailList.append("\(vitaminA)")
            
            
        }else{
            
            
        }
        
        
        let substituteSecondController = SubstituteSecondController()
//        substituteSecondController.detailList = detailList
        substituteSecondController.index = self.index 
        substituteSecondController.fixedDimensionalArray = fixedDimensionalArray
        substituteSecondController.selectedOldFoodObject = filteredFixedDimensionalArray[indexPath.section].names[indexPath.row] as NSObject as! FoodObject
        
        //substituteSecondController.selectedOldFoodStruct.
        
        
//        substituteSecondController.substituteFirstController = self.substituteFirstController
        substituteSecondController.homePageController = self.homePageController
//        detailList = [String]()
        let oldNavigationController = self.substituteFirstController?.navigationController
        oldNavigationController?.pushViewController(substituteSecondController, animated: true)
        
        
    }
    
}

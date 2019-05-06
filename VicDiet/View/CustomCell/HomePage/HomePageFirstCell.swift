//
//  HomePageFirstCell.swift
//  VicDiet
//
//  Created by Ming Yang on 3/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class HomePageFirstCell: UICollectionViewCell,UITableViewDelegate, UITableViewDataSource{
    
    var homePageController: HomePageController?
    lazy var tableViewInFirstPage: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        return tv
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableViewInFirstPage.register(DashboardOverviewCell.self, forCellReuseIdentifier: "DashboardOverviewCellId0")
        tableViewInFirstPage.register(DashboardOverviewCell.self, forCellReuseIdentifier: "DashboardOverviewCellId1")
        tableViewInFirstPage.register(DashboardOverviewCell.self, forCellReuseIdentifier: "DashboardOverviewCellId2")
        tableViewInFirstPage.register(DashboardOverviewCell.self, forCellReuseIdentifier: "DashboardOverviewCellId3")
        tableViewInFirstPage.register(DashboardOverviewCell.self, forCellReuseIdentifier: "DashboardOverviewCellId4")
        tableViewInFirstPage.register(DashboardOverviewCell.self, forCellReuseIdentifier: "DashboardOverviewCellId5")
        tableViewInFirstPage.register(FoodIntakeTodayTableViewCell.self, forCellReuseIdentifier: "FoodIntakeTodayTableViewCellId")
        backgroundColor = UIColor.white
        tableViewInFirstPage.separatorStyle = .none
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section == 0){
            if(indexPath.row == 0){
                let dashBoardDetailController = DashBoardDetailController()
                dashBoardDetailController.homePageController = self.homePageController
                dashBoardDetailController.intakeProgressObject = self.homePageController!.intakeProgressObject
                dashBoardDetailController.targetPersonGroupList = self.homePageController!.targetPersonGroupList
                let oldNavigationController = self.homePageController!.navigationController
                oldNavigationController?.pushViewController(dashBoardDetailController, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 1
        }
        if section == 1{
            return (homePageController?.foodIntakeTodayList.count)!
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.section == 1 {
            return .delete
        }
        return .none
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deletedFood = homePageController?.foodIntakeTodayList.remove(at: indexPath.row)
            NotificationCenter.default.post(name: NSNotification.Name("reloadHomePageData"), object: nil)
            tableViewInFirstPage.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            let mark = homePageController!.intakeProgressObject.progressMark*100
            if mark < 50{
                let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardOverviewCellId0", for: indexPath) as! DashboardOverviewCell
                cell.setupCellView(grade: "D")
                return cell
            }
            if mark >= 50 && mark < 60{
                let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardOverviewCellId1", for: indexPath) as! DashboardOverviewCell
                cell.setupCellView(grade: "C")
                return cell
            }
            if mark >= 60 && mark < 70{
                let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardOverviewCellId2", for: indexPath) as! DashboardOverviewCell
                cell.setupCellView(grade: "B")
                return cell
            }
            if mark >= 70 && mark < 80{
                let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardOverviewCellId3", for: indexPath) as! DashboardOverviewCell
                cell.setupCellView(grade: "A")
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardOverviewCellId4", for: indexPath) as! DashboardOverviewCell
                cell.setupCellView(grade: "S")
                return cell
            }
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FoodIntakeTodayTableViewCellId", for: indexPath) as! FoodIntakeTodayTableViewCell
            cell.foodNameLabel.text = homePageController?.foodIntakeTodayList[indexPath.row].name
            cell.foodDescriptionLabel.text = homePageController?.foodIntakeTodayList[indexPath.row].surveyFlag
            cell.foodWeightLabel.text = "\((homePageController?.foodIntakeTodayList[indexPath.row].num)!*100)g"
            
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1{
            let header = FoodIntakeTodayheaderView()
            return header
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1{
            return self.frame.width*0.2
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0){
            return self.frame.height*0.5
        }else{
            return self.frame.height*0.1
        }
    }
    
    func setupLayout(){
        addSubview(tableViewInFirstPage)
        tableViewInFirstPage.translatesAutoresizingMaskIntoConstraints = false
        tableViewInFirstPage.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        tableViewInFirstPage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        tableViewInFirstPage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        tableViewInFirstPage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50).isActive = true
    }
    
}


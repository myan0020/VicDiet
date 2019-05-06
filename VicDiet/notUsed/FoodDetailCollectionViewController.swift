//
//  FoodDetailCollectionViewController.swift
//  VicDiet
//
//  Created by Ming Yang on 16/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit



class FoodDetailCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {


    
    private let reuseIdentifier = "Cell"
    private let secondCellId = "secondCellId"
    private let thirdCellId = "thirdCellId"
    
    var searchingViewController: SearchingViewController?
    var homePageController: HomePageController?
    
    var detailList = [String]()
    var detailTitle = ["Food Name","Detail","Protein (g)","Calcium (Ca) (mg)","Total fat (g)","Sodium (Na) (mg)","Vitamin C (mg)","Vitamin A retinol equivalents (µg)"]
    var fixedDimensionalArray = [ExpandableNames]()
    
    var selectedFoodObject: FoodObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        setupBackBarButtons()
        
        collectionView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.register(FoodDetailSecondCell.self, forCellWithReuseIdentifier: secondCellId)
        self.collectionView!.register(FoodDetailThirdCell.self, forCellWithReuseIdentifier: thirdCellId)
        
        // Do any additional setup after loading the view.
    }

    @objc func handleBack(){
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func setupBackBarButtons(){
        let backImage = UIImage(named: "icon_back")?.withRenderingMode((.alwaysOriginal))
        let backBarButtonItem = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(handleBack))
        navigationItem.leftBarButtonItem = backBarButtonItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 125/255, green: 206/255, blue: 148/255, alpha: 1)
    }

    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 2
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Configure the cell
    
        if(indexPath.item == 1){
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: secondCellId, for: indexPath) as! FoodDetailSecondCell
            cell.foodDetailCollectionViewController = self
            
            return cell
        }
        if(indexPath.item == 2){
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: thirdCellId, for: indexPath) as! FoodDetailThirdCell
            cell.foodDetailCollectionViewController = self
            cell.homePageController = self.homePageController
            cell.addFoodButton.addTarget(self, action: #selector(handleAddFood), for: .touchUpInside)
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .white
        return cell
    }
    @objc func handleAddFood(){
        self.homePageController?.foodIntakeTodayList.append(selectedFoodObject!)
        NotificationCenter.default.post(name: NSNotification.Name("reloadHomePageData"), object: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(indexPath.item == 0){
            return CGSize(width: 0, height: 0)
        }
        if(indexPath.item == 1){
            return CGSize(width: view.frame.width, height: view.frame.height*2)
        }
        return CGSize(width: view.frame.width, height: view.frame.height*0.5/4)
    }
}

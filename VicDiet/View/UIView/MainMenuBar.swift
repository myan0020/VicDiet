//
//  MainMenuBar.swift
//  VicDiet
//
//  Created by Ming Yang on 3/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit


class MainMenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    var homePageController: HomePageController?
    var addTabLauncher: AddTabLauncher?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //cv.backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 103/255, alpha: 1)
        cv.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        //cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        //cv.backgroundColor = homePageController?.navigationController?.navigationBar.backgroundColor
        
        return cv
        
    }()
    
    let mainMenuCellId = "mainMenuCellId"

    let selectedImages = ["icon_home", "icon_add_clicked", "icon_aboutMe"]
    let imageNames = ["icon_home_clicked", "icon_add_unclicked", "icon_aboutMe_clicked"]
  
    var previousIndexClicked: IndexPath?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: mainMenuCellId)
        
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainMenuCellId, for: indexPath) as! MenuCell

        
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])
        if(indexPath.item == 0){
            cell.imageView.image = UIImage(named: selectedImages[indexPath.item])
            previousIndexClicked = indexPath
        }
        //cell.tintColor = UIColor(red: 255/255, green: 204/255, blue: 103/255, alpha: 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
   
        return CGSize(width: frame.width / 3, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.item == 1{
            //the center menu button is clicked, addTabLauncher activated
            addTabLauncher = AddTabLauncher()
            addTabLauncher?.navigationController = self.homePageController?.navigationController
            addTabLauncher?.homePageController = self.homePageController
            addTabLauncher?.mainMenuBar = self
            addTabLauncher?.showLauncher()
            
            return
        }
        
        let previousCell = collectionView.cellForItem(at: previousIndexClicked!) as! MenuCell
        previousCell.imageView.image = UIImage(named: imageNames[previousIndexClicked!.item])
        
        let cell = collectionView.cellForItem(at: indexPath) as! MenuCell
        cell.imageView.image = UIImage(named: selectedImages[indexPath.item])
        previousIndexClicked = indexPath
        
        if indexPath.item > 1{
            homePageController?.scrollToMainMenuIndex(menuIndex: indexPath.item - 1)
            homePageController?.navigationItem.title = navigationTitles[indexPath.item - 1]
        }else{
            homePageController?.scrollToMainMenuIndex(menuIndex: indexPath.item)
            homePageController?.navigationItem.title = navigationTitles[indexPath.item]
        }
        
        
    }
    
    
}

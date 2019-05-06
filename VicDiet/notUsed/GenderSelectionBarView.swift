//
//  MainMenuBar.swift
//  VicDiet
//
//  Created by Ming Yang on 3/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit


class GenderSelectionBarView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    //var homePageController: HomePageController?
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        cv.dataSource = self
        cv.delegate = self
        
        return cv
        
    }()
    
    let genderCellId = "GenderCellIdId"
    
    let selectedImages = ["icon_male_checked", "icon_female_checked"]
    let imageNames = ["icon_male_unchecked", "icon_female_unchecked"]
    
    var previousIndexClicked: IndexPath?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        collectionView.register(GenderCell.self, forCellWithReuseIdentifier: genderCellId)
        
        
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
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: genderCellId, for: indexPath) as! GenderCell
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])
        if(indexPath.item == 0){
            cell.imageView.image = UIImage(named: selectedImages[indexPath.item])
            previousIndexClicked = indexPath
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: frame.width / 2, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let previousCell = collectionView.cellForItem(at: previousIndexClicked!) as! GenderCell
        previousCell.imageView.image = UIImage(named: imageNames[previousIndexClicked!.item])
        
        let cell = collectionView.cellForItem(at: indexPath) as! GenderCell
        cell.imageView.image = UIImage(named: selectedImages[indexPath.item])
        previousIndexClicked = indexPath
 
        //homePageController?.scrollToMainMenuIndex(menuIndex: indexPath.item)
        
        //homePageController?.navigationItem.title = navigationTitles[indexPath.item]
        
    }
    
    
}

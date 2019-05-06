//
//  FoodCell.swift
//  VicDiet
//
//  Created by Ming Yang on 5/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit


class FoodCell: UICollectionViewCell,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var homePageController: HomePageController?
    weak var navigationController: UINavigationController?
    let cellId = "cellId"
    let searchCellId = "searchCellId"
    lazy var collectionViewNestedFirst: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.lightGray
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    private let searchImageView: UIImageView = {
        let searchImageView = UIImageView.init(image: UIImage(named: "icon_searchBar"))
        searchImageView.translatesAutoresizingMaskIntoConstraints = false
        searchImageView.contentMode = .scaleAspectFit
        return searchImageView
    }()
    lazy var collectionViewNestedInSearching: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.lightGray
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews(){
        addSubview(collectionViewNestedFirst)
        collectionViewNestedFirst.translatesAutoresizingMaskIntoConstraints = false
        collectionViewNestedFirst.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        collectionViewNestedFirst.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        collectionViewNestedFirst.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        collectionViewNestedFirst.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        collectionViewNestedFirst.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionViewNestedFirst.register(UICollectionViewCell.self, forCellWithReuseIdentifier: searchCellId)
        collectionViewNestedFirst.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(indexPath.item == 0){
            let cell = collectionViewNestedFirst.dequeueReusableCell(withReuseIdentifier: searchCellId, for: indexPath)
            cell.backgroundColor = .white
            let topImageContainerView = UIView()
            topImageContainerView.layer.borderWidth = 2
            topImageContainerView.layer.borderColor = UIColor(white: 200/255, alpha: 1).cgColor
            topImageContainerView.backgroundColor = .white
            cell.addSubview(topImageContainerView)
            topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
            topImageContainerView.topAnchor.constraint(equalTo: cell.topAnchor, constant: cell.frame.height/8).isActive = true
            topImageContainerView.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: cell.frame.width/20).isActive = true
            topImageContainerView.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -cell.frame.width/20).isActive = true
            topImageContainerView.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: -cell.frame.height/8).isActive = true
        
            topImageContainerView.addSubview(searchImageView)
            searchImageView.translatesAutoresizingMaskIntoConstraints = false
            searchImageView.topAnchor.constraint(equalTo: topImageContainerView.topAnchor, constant: 0).isActive = true
            searchImageView.leadingAnchor.constraint(equalTo: topImageContainerView.leadingAnchor, constant: 0).isActive = true
            searchImageView.bottomAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 0).isActive = true
            return cell
        }
        if(indexPath.item == 1){
            let cell = collectionViewNestedFirst.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
            cell.backgroundColor = .white
            return cell
        }
        let cell = collectionViewNestedFirst.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (indexPath.item == 0){
            return CGSize(width: frame.width, height: frame.height/3)
        }
        if (indexPath.item == 1){
            return CGSize(width: frame.width, height: frame.height/3)
        }else{
            return CGSize(width: frame.width, height: frame.height*1/3)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(indexPath.item == 0){
            let searchingViewController = SearchingViewController()
            searchingViewController.homePageController = self.homePageController
            let oldNavigationController = self.navigationController
            oldNavigationController?.pushViewController(searchingViewController, animated: true)
        }
        if(indexPath.item == 2){
            let mealListController = MealListController()
            mealListController.homePageController = self.homePageController
            mealListController.mealObjectList = (self.homePageController?.mealObjectList)!
            let oldNavigationController = self.navigationController
            oldNavigationController?.pushViewController(mealListController, animated: true)
        }else{
            
        }
    }
    
    
    
    
    
    
    
}

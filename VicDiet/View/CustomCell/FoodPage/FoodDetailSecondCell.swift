//
//  FoodDetailSecondCell.swift
//  VicDiet
//
//  Created by Ming Yang on 16/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class FoodDetailSecondCell: UICollectionViewCell,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    var foodDetailCollectionViewController: FoodDetailCollectionViewController?
    let cellIdFirst = "cellIdFirst"
    let cellIdSecond = "cellIdSecond"
    lazy var collectionViewNested: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .gray
        cv.isPagingEnabled = true
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        collectionViewNested.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdFirst)
        collectionViewNested.register(FoodDetailSecondCellTextCell.self, forCellWithReuseIdentifier: cellIdSecond)
        setupCellView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.foodDetailCollectionViewController?.detailList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewNested.dequeueReusableCell(withReuseIdentifier: cellIdSecond, for: indexPath) as! FoodDetailSecondCellTextCell
        cell.cellTextViewLabel.text = self.foodDetailCollectionViewController?.detailTitle[indexPath.item]
        cell.cellTextViewValue.text = self.foodDetailCollectionViewController?.detailList[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: self.collectionViewNested.frame.height/8)
    }
    
    func setupCellView(){
        addSubview(collectionViewNested)
        collectionViewNested.translatesAutoresizingMaskIntoConstraints = false
        collectionViewNested.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionViewNested.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionViewNested.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionViewNested.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    
}

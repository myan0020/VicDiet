//
//  TipsCell.swift
//  VicDiet
//
//  Created by Ming Yang on 5/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class TipsCell: UICollectionViewCell,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var collectionViewNestedFirst: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.lightGray
        
        cv.dataSource = self
        cv.delegate = self
        
        
        return cv
        
    }()
    
    let cellId = "cellId"
    
    
    func setupViews(){
        
        addSubview(collectionViewNestedFirst)
        
        collectionViewNestedFirst.translatesAutoresizingMaskIntoConstraints = false
        collectionViewNestedFirst.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        collectionViewNestedFirst.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        collectionViewNestedFirst.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        collectionViewNestedFirst.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        collectionViewNestedFirst.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionViewNestedFirst.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewNestedFirst.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        if(indexPath.item == 5){
            
            cell.backgroundColor = .white
            return cell
        }
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
}

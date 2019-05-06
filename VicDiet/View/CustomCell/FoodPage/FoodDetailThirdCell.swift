//
//  FoodDetailThirdCell.swift
//  VicDiet
//
//  Created by Ming Yang on 16/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class FoodDetailThirdCell: UICollectionViewCell {
    
    var foodDetailCollectionViewController: FoodDetailCollectionViewController?
    var homePageController: HomePageController?
    let addFoodButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Food", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupCellView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCellView(){
        addSubview(addFoodButton)
        addFoodButton.translatesAutoresizingMaskIntoConstraints = false
        addFoodButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        addFoodButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        addFoodButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        addFoodButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.55).isActive = true
    }
    
    
    
}

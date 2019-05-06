//
//  FoodIntakeTodayHeaderCell.swift
//  VicDiet
//
//  Created by Ming Yang on 16/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class FoodIntakeTodayHeaderCell: UICollectionViewCell {
    let foodIntakeTodayLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        label.text = "Food Intake Today"
        label.font = UIFont(name: "Montserrat", size: 24)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(foodIntakeTodayLabel)
        
        foodIntakeTodayLabel.translatesAutoresizingMaskIntoConstraints = false
        foodIntakeTodayLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        foodIntakeTodayLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        foodIntakeTodayLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        foodIntakeTodayLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

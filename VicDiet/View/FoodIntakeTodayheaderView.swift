//
//  FoodIntakeTodayheaderView.swift
//  VicDiet
//
//  Created by Ming Yang on 17/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class FoodIntakeTodayheaderView: UIView {
    
    let foodIntakeTodayLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.text = "Food Intake Today"
        label.font = UIFont(name: "Montserrat", size: 30)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(foodIntakeTodayLabel)
        backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        foodIntakeTodayLabel.translatesAutoresizingMaskIntoConstraints = false
        foodIntakeTodayLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        foodIntakeTodayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        foodIntakeTodayLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        foodIntakeTodayLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
}

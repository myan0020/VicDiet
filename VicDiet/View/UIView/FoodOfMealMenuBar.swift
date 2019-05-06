//
//  FoodOfMealMenuBar.swift
//  VicDiet
//
//  Created by Ming Yang on 18/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class FoodOfMealMenuBar: UIView {

    private let chooseToEat: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Eat them now", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        
        button.addTarget(self, action: #selector(handleChooseToEat), for: .touchUpInside)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleChooseToEat(){
        print("You have eaten them successfully！")
    }
    
    func setupView(){
        backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        
        
        
        
    }
}

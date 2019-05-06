//
//  MealTitleCell.swift
//  VicDiet
//
//  Created by Ming Yang on 25/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class MealTitleCell: UITableViewCell {

   
    let mealImageView: UIImageView = {
        let mealImageView = UIImageView()
        mealImageView.image = UIImage(named: "icon_meal_1")
        return mealImageView
    }()
    
    let mealNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.text = "MealName"
        label.font = UIFont(name: "Montserrat", size: 10)
        return label
    }()
    let mealNameTextField: UITextField = {
        let textField = UITextField()
        textField.isUserInteractionEnabled = false
        
        textField.placeholder = "Edit your meal name here"
        return textField
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellView(){
        backgroundColor = .white
        
        addSubview(mealImageView)
        mealImageView.translatesAutoresizingMaskIntoConstraints = false
        mealImageView.topAnchor.constraint(equalTo: topAnchor, constant: self.frame.height*1.3).isActive = true
        mealImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        mealImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        mealImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.23).isActive = true
        addSubview(mealNameTextField)
        mealNameTextField.translatesAutoresizingMaskIntoConstraints = false
        mealNameTextField.topAnchor.constraint(equalTo: topAnchor, constant: self.frame.height*1.3).isActive = true
        mealNameTextField.leadingAnchor.constraint(equalTo: mealImageView.trailingAnchor, constant: 0).isActive = true
        mealNameTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.77).isActive = true
        mealNameTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        
    }
    
    
    
}

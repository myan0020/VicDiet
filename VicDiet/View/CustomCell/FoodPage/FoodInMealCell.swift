//
//  FoodIntakeTodayTableViewCell.swift
//  VicDiet
//
//  Created by Ming Yang on 17/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class FoodInMealCell: UITableViewCell {
    
    let foodNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.text = "FoodName"
        label.font = UIFont(name: "Montserrat", size: 10)
        return label
    }()
    let foodDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.text = "FoodDescription"
        label.font = UIFont(name: "Montserrat", size: 7)
        return label
    }()
    let foodWeightLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .right
        label.text = "100g"
        label.font = UIFont(name: "Montserrat", size: 8)
        return label
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
        self.selectionStyle = .none
        
        self.contentView.addSubview(foodNameLabel)
        foodNameLabel.translatesAutoresizingMaskIntoConstraints = false
        foodNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        foodNameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        foodNameLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.6).isActive = true
        foodNameLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.6).isActive = true
        
        self.contentView.addSubview(foodDescriptionLabel)
        foodDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        foodDescriptionLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        foodDescriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        foodDescriptionLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.6).isActive = true
        foodDescriptionLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.4).isActive = true
        
        self.contentView.addSubview(foodWeightLabel)
        foodWeightLabel.translatesAutoresizingMaskIntoConstraints = false
        foodWeightLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        foodWeightLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        foodWeightLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        foodWeightLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.4).isActive = true
    }
}

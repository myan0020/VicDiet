//
//  FoodIntakeTodayTableViewCell.swift
//  VicDiet
//
//  Created by Ming Yang on 17/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class FoodIntakeTodayTableViewCell: UITableViewCell {

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
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellView(){
        backgroundColor = .white
        addSubview(foodNameLabel)
        foodNameLabel.translatesAutoresizingMaskIntoConstraints = false
        foodNameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        foodNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        foodNameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6).isActive = true
        foodNameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        addSubview(foodDescriptionLabel)
        foodDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        foodDescriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        foodDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        foodDescriptionLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6).isActive = true
        foodDescriptionLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        addSubview(foodWeightLabel)
        foodWeightLabel.translatesAutoresizingMaskIntoConstraints = false
        foodWeightLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        foodWeightLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        foodWeightLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        foodWeightLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
    }
}

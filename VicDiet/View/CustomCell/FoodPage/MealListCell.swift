//
//  MealListCell.swift
//  VicDiet
//
//  Created by Ming Yang on 18/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class MealListCell: UITableViewCell {

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
    let mealDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.text = "MealDescription"
        label.font = UIFont(name: "Montserrat", size: 4)
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
        
        self.contentView.addSubview(mealImageView)
        mealImageView.translatesAutoresizingMaskIntoConstraints = false
        mealImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        mealImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0).isActive = true
        mealImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        mealImageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.34).isActive = true
        self.contentView.addSubview(mealNameLabel)
        mealNameLabel.translatesAutoresizingMaskIntoConstraints = false
        mealNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        mealNameLabel.leadingAnchor.constraint(equalTo: mealImageView.trailingAnchor, constant: 0).isActive = true
        mealNameLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.4).isActive = true
        mealNameLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.4).isActive = true
        self.contentView.addSubview(mealDescriptionLabel)
        mealDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        mealDescriptionLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        mealDescriptionLabel.leadingAnchor.constraint(equalTo: mealImageView.trailingAnchor).isActive = true
        mealDescriptionLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.6).isActive = true
        mealDescriptionLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.75).isActive = true
    }
}

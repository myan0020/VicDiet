//
//  FoodDetailCell.swift
//  VicDiet
//
//  Created by Ming Yang on 26/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class FoodDetailCell: UITableViewCell {

    let foodDetailLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.text = "Different ages in people will be very important to evalute your standard intake and health condition."
        label.font =  UIFont.systemFont(ofSize: 13)
        label.backgroundColor = .clear
        label.textAlignment = .left
        
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
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
        self.selectionStyle = .none
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupCell(){
        addSubview(foodDetailLabel)
        foodDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        foodDetailLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        foodDetailLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        foodDetailLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        foodDetailLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1).isActive = true
    }
}

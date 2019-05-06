//
//  AddFoodToMealCell.swift
//  VicDiet
//
//  Created by Ming Yang on 19/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class AddFoodButtonCell: UITableViewCell {

    let addFoodButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+ Add more food", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .white
        return button
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
        addSubview(addFoodButton)
        self.selectionStyle = .none
        addFoodButton.translatesAutoresizingMaskIntoConstraints = false
        addFoodButton.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        addFoodButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        addFoodButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -frame.width/2).isActive = true
        addFoodButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
}

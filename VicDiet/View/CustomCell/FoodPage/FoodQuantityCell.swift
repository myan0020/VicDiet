//
//  FoodQuantityCell.swift
//  VicDiet
//
//  Created by Ming Yang on 26/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class FoodQuantityCell: UITableViewCell {

    let inputTextField: LogInTextField = {
        let textField = LogInTextField()
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    let gramLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.text = "serve"
        label.font =  UIFont.boldSystemFont(ofSize: 15)
        label.backgroundColor = .clear
        label.textAlignment = .center
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let serveLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.text = "1 serve = 100 g"
        label.font =  UIFont.boldSystemFont(ofSize: 15)
        label.backgroundColor = .clear
        label.textAlignment = .center
        
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
        addSubview(inputTextField)
        addSubview(gramLabel)
        addSubview(serveLabel)
        inputTextField.translatesAutoresizingMaskIntoConstraints = false
        gramLabel.translatesAutoresizingMaskIntoConstraints = false
        serveLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            inputTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            inputTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            inputTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25),
            inputTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4)
            ])
        NSLayoutConstraint.activate([
            gramLabel.leftAnchor.constraint(equalTo: inputTextField.rightAnchor, constant: 5),
            gramLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            gramLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            gramLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7)
            ])
        
        NSLayoutConstraint.activate([
            serveLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            serveLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            serveLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            serveLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7)
            ])
        
    }
    
    
    
}

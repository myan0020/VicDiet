//
//  DashboardHeaderCell.swift
//  VicDiet
//
//  Created by Ming Yang on 16/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class DashboardHeaderCell: UICollectionViewCell {
    
    let dashboardHeaderLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        label.text = "Dashboard"
        label.font = UIFont(name: "Montserrat", size: 24)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(dashboardHeaderLabel)
        
        dashboardHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        dashboardHeaderLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        dashboardHeaderLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        dashboardHeaderLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        dashboardHeaderLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

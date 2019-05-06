//
//  DashboardHeaderView.swift
//  VicDiet
//
//  Created by Ming Yang on 17/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class DashboardHeaderView: UIView {

    let dashboardHeaderLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.text = "Dashboard"
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
        addSubview(dashboardHeaderLabel)
        dashboardHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        dashboardHeaderLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        dashboardHeaderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        dashboardHeaderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        dashboardHeaderLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
}

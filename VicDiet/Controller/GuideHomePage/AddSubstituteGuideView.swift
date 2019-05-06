//
//  PhysicalInputGuideView.swift
//  VicDiet
//
//  Created by Ming Yang on 6/5/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class AddSubstituteGuideView: UIView {
    
    let skipOutButton: UIButton = {
        
        let button = UIButton(type: UIButton.ButtonType.custom) as UIButton
        button.setTitle("Skip", for: .normal)
        //button.setImage(UIImage(named: "icon_substitute"), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor.white.withAlphaComponent(1), for: .normal)
        //button.backgroundColor = UIColor.black.withAlphaComponent(1)
        button.alpha = 1
        return button
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "Substitution function enables you to search and eat a new food item that has similar nutrition structure with the food item you want to replace, and the new one always has lower target nutrition content than the old one. "
        label.font =  UIFont.boldSystemFont(ofSize: 18)
        label.backgroundColor = .clear
        label.textAlignment = .center
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor.black.withAlphaComponent(0.7)
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: topAnchor, constant: 64 + frame.height*0.1).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        label.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        label.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        
        addSubview(skipOutButton)
        skipOutButton.translatesAutoresizingMaskIntoConstraints = false
        skipOutButton.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        skipOutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        skipOutButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3).isActive = true
        skipOutButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
        
        let path = CGMutablePath()
        path.addArc(center: CGPoint(x: frame.width/2, y: frame.height - 100),
                    radius: 50,
                    startAngle: 0.0,
                    endAngle: 2.0 * .pi,
                    clockwise: false)
        path.addRect(CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        
        let maskLayer = CAShapeLayer()
        maskLayer.backgroundColor = UIColor.blue.cgColor
        maskLayer.path = path
        maskLayer.fillRule = .evenOdd
        layer.mask = maskLayer
        clipsToBounds = true
        
    }
    
}

//
//  PhysicalInputGuideView.swift
//  VicDiet
//
//  Created by Ming Yang on 6/5/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class PhysicalInputGuideView: UIView {
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
        label.text = "Before starting your dietary journey, please input your physical information first."
        label.font =  UIFont.boldSystemFont(ofSize: 18)
        label.backgroundColor = .clear
        label.textAlignment = .center
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let transparentHoleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 1, alpha: 1)
        view.alpha = 1
        return view
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.black.withAlphaComponent(0.7)
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: topAnchor, constant: 90).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        label.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        label.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15).isActive = true
        
        addSubview(skipOutButton)
        skipOutButton.translatesAutoresizingMaskIntoConstraints = false
        skipOutButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        skipOutButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        skipOutButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3).isActive = true
        skipOutButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
        
        let path = CGMutablePath()
//        path.addArc(center: CGPoint(x: frame.width/2, y: frame.height/2),
//                    radius: 50,
//                    startAngle: 0.0,
//                    endAngle: 2.0 * .pi,
//                    clockwise: false)
        path.addRects([CGRect(x: frame.width - 65, y: 7, width: 65, height: 65),CGRect(x: 0, y: 0, width: frame.width, height: frame.height)])
        
        let maskLayer = CAShapeLayer()
        maskLayer.backgroundColor = UIColor.blue.cgColor
        maskLayer.path = path
        maskLayer.fillRule = .evenOdd
        layer.mask = maskLayer
        clipsToBounds = true

    }
}

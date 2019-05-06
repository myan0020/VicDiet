//
//  File.swift
//  VicDiet
//
//  Created by Ming Yang on 6/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit


class MenuCell: UICollectionViewCell{
    
    
    
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "icon_home")
        //iv.backgroundColor = .white
        return iv
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCellView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellView(){
        
        addSubview(imageView)
        
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.83).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.47).isActive = true
    }
    
    
    
    
}

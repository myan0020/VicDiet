//
//  FoodDetailSecondCellTextCell.swift
//  VicDiet
//
//  Created by Ming Yang on 16/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class FoodDetailSecondCellTextCell: UICollectionViewCell {
    
    let cellTextViewLabel: UITextView = {
        let textView = UITextView()
        //textView.backgroundColor = .brown
        let physicalAttributedText = NSMutableAttributedString(string: "Calorie:", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .white
        return textView
    }()
    let cellTextViewValue: UITextView = {
        let textView = UITextView()
        //textView.backgroundColor = .brown
        let physicalAttributedText = NSMutableAttributedString(string: "200g", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .white
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        setupCellTextView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellTextView(){
        addSubview(cellTextViewLabel)
        cellTextViewLabel.translatesAutoresizingMaskIntoConstraints = false
        cellTextViewLabel.topAnchor.constraint(equalTo: topAnchor,constant: frame.height*0.01).isActive = true
        cellTextViewLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: frame.width*0.05).isActive = true
        cellTextViewLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1).isActive = true
        cellTextViewLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35).isActive = true
        addSubview(cellTextViewValue)
        cellTextViewValue.translatesAutoresizingMaskIntoConstraints = false
        cellTextViewValue.topAnchor.constraint(equalTo: topAnchor,constant: frame.height*0.01).isActive = true
        cellTextViewValue.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -frame.width*0.05).isActive = true
        cellTextViewValue.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1).isActive = true
        cellTextViewValue.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.55).isActive = true
    }
    
    
}

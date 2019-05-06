//
//  SwipingPhysicalInputPageWeightCell.swift
//  VicDiet
//
//  Created by Ming Yang on 24/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class SwipingPhysicalInputPageGenderCell: UICollectionViewCell,UITextFieldDelegate {
    
    var page: Page? {
        didSet{
            guard let unwrappedPage = page else {
                return
            }
            
            
            bootImageView.image = UIImage(named: unwrappedPage.imageName)
            
            let physicalAttributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            
            physicalAttributedText.append(NSMutableAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            bootDescriptionTextView.attributedText = physicalAttributedText
            
            bootDescriptionTextView.textAlignment = .center
        }
    }
    
    
    private let bootImageView: UIImageView = {
        let imageView = UIImageView.init(image: UIImage(named: "swipingPageImage"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let bootDescriptionTextView: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "Let us know your birthday?", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\n\n\nDifferent ages in people will be very important to evalute your standard intake and health condition.", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
        
        
    }()

    let genderSelection : UISegmentedControl = {
        let genderS = UISegmentedControl(items: ["Male","Female"])
        genderS.selectedSegmentIndex = 0
        genderS.layer.cornerRadius = 5.0
        return genderS
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout(){
        addSubview(bootDescriptionTextView)
        
        bootDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        bootDescriptionTextView.topAnchor.constraint(equalTo: topAnchor, constant: frame.height/9).isActive = true
        bootDescriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        bootDescriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        bootDescriptionTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true

        addSubview(genderSelection)
        genderSelection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            genderSelection.topAnchor.constraint(equalTo: bootDescriptionTextView.bottomAnchor, constant: self.frame.height*0.05),
            genderSelection.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            genderSelection.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            genderSelection.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -self.frame.height*0.45)
            ])
    }
    
    
}

//
//  NutrientProgressCell.swift
//  VicDiet
//
//  Created by Ming Yang on 22/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class NutrientProgressInFoodCell: UICollectionViewCell {
    
    var progressView = UIProgressView(progressViewStyle: UIProgressView.Style.default)
//    let leftLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = UIColor.black
//        label.textAlignment = .center
//        label.text = "Low"
//        label.font = label.font.withSize(10)
//        return label
//    }()
//    let middleLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = UIColor.black
//        label.textAlignment = .center
//        label.text = "Mid"
//        label.font = label.font.withSize(10)
//        return label
//    }()
//    let rightLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = UIColor.black
//        label.textAlignment = .center
//        label.text = "Perfect"
//        label.font = label.font.withSize(10)
//        return label
//    }()
//    let topLeftView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .blue
//        return view
//    }()
//    let topLeftLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = UIColor.black
//        label.textAlignment = .left
//        label.text = "Protein"
//        label.font = label.font.withSize(15)
//        return label
//    }()
    let middleKeyLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.text = "60%"
        label.font = label.font.withSize(12)
        return label
    }()
    let middleKeyReferenceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.text = "Protein"
        label.font = label.font.withSize(12)
        return label
    }()
//    let progressTrackLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = UIColor.white
//        label.textAlignment = .center
//        label.text = "60%"
//        label.font = UIFont.boldSystemFont(ofSize: 10)
//        label.backgroundColor = .blue
//        label.layer.cornerRadius = 10
//        return label
//    }()
    var progress = Float(0)
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellView()
        //backgroundColor = .yellow
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    func setupCellView(){
        progressView.progress = progress
//        addSubview(topLeftView)
//        topLeftView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            topLeftView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//            topLeftView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
//            topLeftView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.02),
//            topLeftView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15)
//            ])
//        addSubview(topLeftLabel)
//        topLeftLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            topLeftLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//            topLeftLabel.leadingAnchor.constraint(equalTo: topLeftView.trailingAnchor, constant: 5),
//            topLeftLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25),
//            topLeftLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15)
//            ])
//        addSubview(middleKeyLabel)
//        middleKeyLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            middleKeyLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
//            middleKeyLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
//            middleKeyLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
//            middleKeyLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15)
//            ])
        
//        let labelsCollectionStackView = UIStackView(arrangedSubviews: [leftLabel,middleLabel,rightLabel])
//        labelsCollectionStackView.translatesAutoresizingMaskIntoConstraints = false
//        labelsCollectionStackView.distribution = .fillEqually
//        self.addSubview(labelsCollectionStackView)
//        NSLayoutConstraint.activate([
//            labelsCollectionStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            labelsCollectionStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
//            labelsCollectionStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
//            labelsCollectionStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)
//            ])
        self.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        progressView.topAnchor.constraint(equalTo: topAnchor, constant: self.frame.height*0.1).isActive = true
        progressView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.095).isActive = true
        progressView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        
        addSubview(middleKeyLabel)
        middleKeyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            middleKeyLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: self.frame.height*0.005),
            middleKeyLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            middleKeyLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6),
            middleKeyLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)
            ])
        addSubview(middleKeyReferenceLabel)
        middleKeyReferenceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            middleKeyReferenceLabel.topAnchor.constraint(equalTo: middleKeyLabel.bottomAnchor, constant: 0),
            middleKeyReferenceLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            middleKeyReferenceLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6),
            middleKeyReferenceLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)
            ])
    }
    
    
    
}

//
//  GraphicContentCell.swift
//  VicDiet
//
//  Created by Ming Yang on 5/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class GraphicContentCell: UICollectionViewCell{
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .brown
        
        setupLayout()
        setupText()
        setupShapeLayer()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let leftImageContainerView = UIView()
    let middleImageContainerView = UIView()
    let rightImageContainerView = UIView()
    
    let nutrientTypeTextViewLeft: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Calorie", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13)])
        textView.backgroundColor = UIColor.white
        
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    let nutrientTypeTextViewMiddle: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Protein", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13)])
        textView.backgroundColor = UIColor.white
        
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    let nutrientTypeTextViewRight: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Fat", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13)])
        textView.backgroundColor = UIColor.white
        
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    func setupLayout(){
        
        //let leftImageContainerView = UIView()
        leftImageContainerView.backgroundColor = .white
        addSubview(leftImageContainerView)
        leftImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        leftImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        leftImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        leftImageContainerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        leftImageContainerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.33).isActive = true
        leftImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1).isActive = true
        
        
        
        
        
        //let middleImageContainerView = UIView()
        middleImageContainerView.backgroundColor = .white
        addSubview(middleImageContainerView)
        middleImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        middleImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        middleImageContainerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        middleImageContainerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        middleImageContainerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        middleImageContainerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.33).isActive = true
        middleImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1).isActive = true
        
        
        //let rightImageContainerView = UIView()
        rightImageContainerView.backgroundColor = .white
        addSubview(rightImageContainerView)
        rightImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        rightImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        rightImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        rightImageContainerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        rightImageContainerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.33).isActive = true
        rightImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1).isActive = true
        
        
        
        
        
        
        
        
    }
    
    
    func setupText(){
        leftImageContainerView.addSubview(nutrientTypeTextViewLeft)
        nutrientTypeTextViewLeft.translatesAutoresizingMaskIntoConstraints = false
        nutrientTypeTextViewLeft.topAnchor.constraint(equalTo: leftImageContainerView.topAnchor).isActive = true
        nutrientTypeTextViewLeft.leadingAnchor.constraint(equalTo: leftImageContainerView.leadingAnchor).isActive = true
        nutrientTypeTextViewLeft.trailingAnchor.constraint(equalTo: leftImageContainerView.trailingAnchor).isActive = true
        //nutrientTypeTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        nutrientTypeTextViewLeft.widthAnchor.constraint(equalTo: leftImageContainerView.widthAnchor, multiplier: 1).isActive = true
        nutrientTypeTextViewLeft.heightAnchor.constraint(equalTo: leftImageContainerView.heightAnchor, multiplier: 0.2).isActive = true
        
        middleImageContainerView.addSubview(nutrientTypeTextViewMiddle)
        nutrientTypeTextViewMiddle.translatesAutoresizingMaskIntoConstraints = false
        nutrientTypeTextViewMiddle.topAnchor.constraint(equalTo: middleImageContainerView.topAnchor).isActive = true
        nutrientTypeTextViewMiddle.leadingAnchor.constraint(equalTo: middleImageContainerView.leadingAnchor).isActive = true
        nutrientTypeTextViewMiddle.trailingAnchor.constraint(equalTo: middleImageContainerView.trailingAnchor).isActive = true
        //nutrientTypeTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        nutrientTypeTextViewMiddle.widthAnchor.constraint(equalTo: middleImageContainerView.widthAnchor, multiplier: 1).isActive = true
        nutrientTypeTextViewMiddle.heightAnchor.constraint(equalTo: middleImageContainerView.heightAnchor, multiplier: 0.2).isActive = true
        
        rightImageContainerView.addSubview(nutrientTypeTextViewRight)
        nutrientTypeTextViewRight.translatesAutoresizingMaskIntoConstraints = false
        nutrientTypeTextViewRight.topAnchor.constraint(equalTo: rightImageContainerView.topAnchor).isActive = true
        nutrientTypeTextViewRight.leadingAnchor.constraint(equalTo: rightImageContainerView.leadingAnchor).isActive = true
        nutrientTypeTextViewRight.trailingAnchor.constraint(equalTo: rightImageContainerView.trailingAnchor).isActive = true
        //nutrientTypeTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        nutrientTypeTextViewRight.widthAnchor.constraint(equalTo: rightImageContainerView.widthAnchor, multiplier: 1).isActive = true
        nutrientTypeTextViewRight.heightAnchor.constraint(equalTo: rightImageContainerView.heightAnchor, multiplier: 0.2).isActive = true
    }
    
    
    func setupShapeLayer(){
        
        let trackLayerLeft = CAShapeLayer()
        let circularPathLeft = UIBezierPath(arcCenter: CGPoint(x: frame.width/6, y: frame.height*2/3), radius: min(frame.width/4,frame.height)/2, startAngle: CGFloat(-0.5 * .pi), endAngle: 1.5*CGFloat.pi, clockwise: true)
        trackLayerLeft.path = circularPathLeft.cgPath
        trackLayerLeft.strokeColor = UIColor.yellow.cgColor
        trackLayerLeft.lineWidth = 10
        trackLayerLeft.strokeEnd = 1
        //trackLayerLeft.lineCap = CAShapeLayerLineCap(rawValue: "round")
        trackLayerLeft.fillColor = UIColor.clear.cgColor
        leftImageContainerView.layer.addSublayer(trackLayerLeft)
        
        let shapeLayerLeft = CAShapeLayer()
        shapeLayerLeft.path = circularPathLeft.cgPath
        shapeLayerLeft.strokeColor = UIColor.red.cgColor
        shapeLayerLeft.lineWidth = 10
        shapeLayerLeft.strokeEnd = 0.8
        //shapeLayerLeft.lineCap = CAShapeLayerLineCap(rawValue: "round")
        shapeLayerLeft.fillColor = UIColor.clear.cgColor
        leftImageContainerView.layer.addSublayer(shapeLayerLeft)
        
        
        
        
        let trackLayerMiddle = CAShapeLayer()
        let circularPathMiddle = UIBezierPath(arcCenter: CGPoint(x: frame.width/6, y: frame.height*2/3), radius: min(frame.width/4,frame.height)/2, startAngle: CGFloat(-0.5 * .pi), endAngle: 1.5*CGFloat.pi, clockwise: true)
        trackLayerMiddle.path = circularPathMiddle.cgPath
        trackLayerMiddle.strokeColor = UIColor.yellow.cgColor
        trackLayerMiddle.lineWidth = 10
        trackLayerMiddle.strokeEnd = 1
        //trackLayerMiddle.lineCap = CAShapeLayerLineCap(rawValue: "round")
        trackLayerMiddle.fillColor = UIColor.clear.cgColor
        middleImageContainerView.layer.addSublayer(trackLayerMiddle)
        
        let shapeLayerMiddle = CAShapeLayer()
        shapeLayerMiddle.path = circularPathMiddle.cgPath
        shapeLayerMiddle.strokeColor = UIColor.red.cgColor
        shapeLayerMiddle.lineWidth = 10
        shapeLayerMiddle.strokeEnd = 0.8
        //shapeLayerMiddle.lineCap = CAShapeLayerLineCap(rawValue: "round")
        shapeLayerMiddle.fillColor = UIColor.clear.cgColor
        middleImageContainerView.layer.addSublayer(shapeLayerMiddle)
        
        
        
        
        
        let trackLayerRight = CAShapeLayer()
        let circularPathRight = UIBezierPath(arcCenter: CGPoint(x: frame.width/6, y: frame.height*2/3), radius: min(frame.width/4,frame.height/2)/2, startAngle: CGFloat(-0.5 * .pi), endAngle: 1.5*CGFloat.pi, clockwise: true)
        trackLayerRight.path = circularPathRight.cgPath
        trackLayerRight.strokeColor = UIColor.yellow.cgColor
        trackLayerRight.lineWidth = 10
        trackLayerRight.strokeEnd = 1
        //trackLayerRight.lineCap = CAShapeLayerLineCap(rawValue: "round")
        trackLayerRight.fillColor = UIColor.clear.cgColor
        rightImageContainerView.layer.addSublayer(trackLayerRight)
        
        let shapeLayerRight = CAShapeLayer()
        shapeLayerRight.path = circularPathRight.cgPath
        shapeLayerRight.strokeColor = UIColor.red.cgColor
        shapeLayerRight.lineWidth = 10
        shapeLayerRight.strokeEnd = 0.8
        //shapeLayerRight.lineCap = CAShapeLayerLineCap(rawValue: "round")
        shapeLayerRight.fillColor = UIColor.clear.cgColor
        rightImageContainerView.layer.addSublayer(shapeLayerRight)
    }
    
    
    
    
    
    
    
    
}


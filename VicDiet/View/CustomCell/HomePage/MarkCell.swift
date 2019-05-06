//
//  MarkCell.swift
//  VicDiet
//
//  Created by Ming Yang on 22/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class MarkCell: UITableViewCell {

    var circularPath: UIBezierPath?
    
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellView(percentageProgress: CGFloat, markFrame: CGRect, textFrame: CGRect){
        backgroundColor = UIColor(red: 255/255, green: 153/255, blue: 0/255, alpha: 1)
        if let circularPath = circularPath{
            let trackLayer = CAShapeLayer()
            let shapeLayer = CAShapeLayer()
            let textLayerMark = CATextLayer()
            let textLayerDescribe = CATextLayer()
            
            trackLayer.path = circularPath.cgPath
            trackLayer.strokeColor = UIColor.init(white: 1, alpha: 0.3).cgColor
            trackLayer.lineWidth = 10
            trackLayer.strokeEnd = 1
            trackLayer.fillColor = UIColor.clear.cgColor
            self.layer.addSublayer(trackLayer)
            
            shapeLayer.path = circularPath.cgPath
            shapeLayer.strokeColor = UIColor.white.cgColor
            shapeLayer.lineWidth = 10
            shapeLayer.strokeStart = 0
            shapeLayer.strokeEnd = percentageProgress
            shapeLayer.fillColor = UIColor.clear.cgColor
            self.layer.addSublayer(shapeLayer)
            
            textLayerMark.font = UIFont.boldSystemFont(ofSize: 30)
            textLayerMark.string = "\(Int(percentageProgress*100))"
            textLayerMark.fontSize = 25
            textLayerMark.frame = markFrame
            textLayerMark.alignmentMode = .center
            textLayerMark.foregroundColor = UIColor.white.cgColor
            self.layer.addSublayer(textLayerMark)
            
            //textLayerDescribe.font = UIFont.boldSystemFont(ofSize: 15)
            textLayerDescribe.string = "Intake Grade"
            textLayerDescribe.fontSize = 15
            textLayerDescribe.frame = textFrame
            textLayerDescribe.alignmentMode = .center
            textLayerDescribe.foregroundColor = UIColor.white.cgColor
            self.layer.addSublayer(textLayerDescribe)
        }
    }
    
    
}

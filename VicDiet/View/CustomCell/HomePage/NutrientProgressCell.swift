//
//  NutrientProgressCell.swift
//  VicDiet
//
//  Created by Ming Yang on 22/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class NutrientProgressCell: UITableViewCell {

    //var progressView = UIProgressView(progressViewStyle: UIProgressView.Style.default)
    
    let progressView: UIProgressView = {
        let pv = UIProgressView(progressViewStyle: UIProgressView.Style.default)
        pv.trackTintColor = UIColor(red: 255/255, green: 246/255, blue: 232/255, alpha: 1)
        pv.progressTintColor = UIColor(red: 255/255, green: 199/255, blue: 116/255, alpha: 1)
        return pv
    }()
    
    let leftLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.textAlignment = .center
        label.text = "Very low"
        label.font = label.font.withSize(12)
        return label
    }()
    let middleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.textAlignment = .center
        label.text = "Low"
        label.font = label.font.withSize(12)
        return label
    }()
    let rightLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.textAlignment = .center
        label.text = "High"
        label.font = label.font.withSize(12)
        return label
    }()
    let topLeftView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 255/255, green: 199/255, blue: 116/255, alpha: 1)
        return view
    }()
    let topLeftLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.text = "Protein"
        label.font = label.font.withSize(15)
        return label
    }()
    let middleKeyLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.text = "60% - Mid"
        label.font = label.font.withSize(16)
        return label
    }()
    let progressTrackLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "60%"
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.backgroundColor = UIColor(red: 255/255, green: 199/255, blue: 116/255, alpha: 1)
        
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        label.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return label
    }()
    var progress = Float(0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupCellView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellView(){
        progressView.progress = progress
        addSubview(topLeftView)
        topLeftView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topLeftView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            topLeftView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            topLeftView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.02),
            topLeftView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)
            ])
        addSubview(topLeftLabel)
        topLeftLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topLeftLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            topLeftLabel.leadingAnchor.constraint(equalTo: topLeftView.trailingAnchor, constant: 8),
            topLeftLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25),
            topLeftLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)
            ])
        addSubview(middleKeyLabel)
        middleKeyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            middleKeyLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            middleKeyLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            middleKeyLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            middleKeyLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15)
            ])
        
        let labelsCollectionStackView = UIStackView(arrangedSubviews: [leftLabel,middleLabel,rightLabel])
        labelsCollectionStackView.translatesAutoresizingMaskIntoConstraints = false
        labelsCollectionStackView.distribution = .fillEqually
        self.addSubview(labelsCollectionStackView)
        NSLayoutConstraint.activate([
            labelsCollectionStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelsCollectionStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelsCollectionStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            labelsCollectionStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)
            ])
        self.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        progressView.topAnchor.constraint(equalTo: labelsCollectionStackView.bottomAnchor, constant: self.frame.height*0.8).isActive = true
        progressView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.015).isActive = true
        progressView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
    }
    
    
    
}

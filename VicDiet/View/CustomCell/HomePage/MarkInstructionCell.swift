//
//  NutrientProgressCell.swift
//  VicDiet
//
//  Created by Ming Yang on 22/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class MarkInstructionCell: UITableViewCell {
    
    let HDLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "S"
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.backgroundColor = UIColor(red: 51/255, green: 204/255, blue: 0/255, alpha: 1)
        //label.backgroundColor = UIColor(red: 37/255, green: 148/255, blue: 0/255, alpha: 1)
        //label.textColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        label.clipsToBounds = true
        label.layer.cornerRadius = 3.5
        label.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return label
    }()
    let DLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "A"
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.backgroundColor = UIColor(red: 153/255, green: 255/255, blue: 51/255, alpha: 1)
        //label.backgroundColor = UIColor(red: 111/255, green: 185/255, blue: 37/255, alpha: 1)
        //label.textColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        label.clipsToBounds = true
        label.layer.cornerRadius = 3.5
        label.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return label
    }()
    let CLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "B"
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.backgroundColor = UIColor(red: 232/255, green: 232/255, blue: 0/255, alpha: 1)
        //label.backgroundColor = UIColor(red: 162/255, green: 162/255, blue: 0/255, alpha: 1)
        //label.textColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        label.clipsToBounds = true
        label.layer.cornerRadius = 3.5
        label.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return label
    }()
    let PLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "C"
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 51/255, alpha: 1)
        //label.backgroundColor = UIColor(red: 185/255, green: 148/255, blue: 37/255, alpha: 1)
        //label.textColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        label.clipsToBounds = true
        label.layer.cornerRadius = 3.5
        label.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return label
    }()
    let NLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "D"
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.backgroundColor = UIColor(red: 255/255, green: 102/255, blue: 0/255, alpha: 1)
        //label.backgroundColor = UIColor(red: 185/255, green: 74/255, blue: 0/255, alpha: 1)
        //label.textColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        label.clipsToBounds = true
        label.layer.cornerRadius = 3.5
        label.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return label
    }()
    
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
    
    func setupCellView(grade: String){
        addSubview(CLabel)
        CLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(DLabel)
        DLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(PLabel)
        PLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(HDLabel)
        HDLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(NLabel)
        NLabel.translatesAutoresizingMaskIntoConstraints = false
        if grade == "B"{
            NSLayoutConstraint.activate([
                CLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
                CLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
                CLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.135),
                CLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.27)
                ])
        }else{
            NSLayoutConstraint.activate([
                CLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
                CLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
                CLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.09),
                CLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.18)
                ])
            
        }
        if grade == "A"{
            NSLayoutConstraint.activate([
                DLabel.rightAnchor.constraint(equalTo: CLabel.leftAnchor, constant: -10),
                DLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
                DLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.135),
                DLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.27)
                ])
        }else{
            NSLayoutConstraint.activate([
                DLabel.rightAnchor.constraint(equalTo: CLabel.leftAnchor, constant: -10),
                DLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
                DLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.09),
                DLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.18)
                ])
        }
        if grade == "C"{
            NSLayoutConstraint.activate([
                PLabel.leftAnchor.constraint(equalTo: CLabel.rightAnchor, constant: 10),
                PLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
                PLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.135),
                PLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.27)
                ])
        }else{
            NSLayoutConstraint.activate([
                PLabel.leftAnchor.constraint(equalTo: CLabel.rightAnchor, constant: 10),
                PLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
                PLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.09),
                PLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.18)
                ])
        }
        if grade == "S"{
            NSLayoutConstraint.activate([
                HDLabel.rightAnchor.constraint(equalTo: DLabel.leftAnchor, constant: -10),
                HDLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
                HDLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.135),
                HDLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.27)
                ])
        }else{
            NSLayoutConstraint.activate([
                HDLabel.rightAnchor.constraint(equalTo: DLabel.leftAnchor, constant: -10),
                HDLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
                HDLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.09),
                HDLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.18)
                ])
        }
        if grade == "D"{
            NSLayoutConstraint.activate([
                NLabel.leftAnchor.constraint(equalTo: PLabel.rightAnchor, constant: 10),
                NLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
                NLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.135),
                NLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.27)
                ])
        }else{
            NSLayoutConstraint.activate([
                NLabel.leftAnchor.constraint(equalTo: PLabel.rightAnchor, constant: 10),
                NLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
                NLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.09),
                NLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.18)
                ])
        }
    }
    
    
    
}

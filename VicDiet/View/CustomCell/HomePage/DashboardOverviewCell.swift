//
//  TableViewCell.swift
//  VicDiet
//
//  Created by Ming Yang on 17/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class DashboardOverviewCell: UITableViewCell {
    
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
        label.layer.cornerRadius = 5
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
        label.layer.cornerRadius = 5
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
        label.layer.cornerRadius = 5
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
        label.layer.cornerRadius = 5
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
        label.layer.cornerRadius = 5
        label.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        return label
    }()
    let levelTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "Healthy Intake Level"
        label.font = UIFont.boldSystemFont(ofSize: 13.0)
        label.backgroundColor = .clear
        label.layer.cornerRadius = 30
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
    
    func setupCellView(grade: String?){
        backgroundView = UIImageView(image: UIImage(named: "dashboardOverviewBackgound"))
       
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
        addSubview(levelTextLabel)
        levelTextLabel.translatesAutoresizingMaskIntoConstraints = false
        if grade == "B"{
            
            NSLayoutConstraint.activate([
                CLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -frame.width/9),
                CLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
                CLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.16),
                CLabel.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.16)
                ])
        }else{
            NSLayoutConstraint.activate([
                CLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -frame.width/9),
                CLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
                CLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
                CLabel.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1)
                ])
            CLabel.backgroundColor = UIColor(red: 162/255, green: 162/255, blue: 0/255, alpha: 1)
            CLabel.textColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        }
        if grade == "A"{
            NSLayoutConstraint.activate([
                DLabel.rightAnchor.constraint(equalTo: CLabel.leftAnchor, constant: -10),
                DLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
                DLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.16),
                DLabel.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.16)
                ])
        }else{
            NSLayoutConstraint.activate([
                DLabel.rightAnchor.constraint(equalTo: CLabel.leftAnchor, constant: -10),
                DLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
                DLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
                DLabel.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1)
                ])
            DLabel.backgroundColor = UIColor(red: 97/255, green: 162/255, blue: 32/255, alpha: 1)
            DLabel.textColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        }
        NSLayoutConstraint.activate([
            levelTextLabel.bottomAnchor.constraint(equalTo: DLabel.topAnchor, constant: -frame.width/15),
            levelTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -frame.width/4.5),
            levelTextLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            levelTextLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.27)
            ])
        if grade == "C"{
            NSLayoutConstraint.activate([
                PLabel.leftAnchor.constraint(equalTo: CLabel.rightAnchor, constant: 10),
                PLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
                PLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.16),
                PLabel.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.16)
                ])
        }else{
            NSLayoutConstraint.activate([
                PLabel.leftAnchor.constraint(equalTo: CLabel.rightAnchor, constant: 10),
                PLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
                PLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
                PLabel.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1)
                ])
            PLabel.backgroundColor = UIColor(red: 185/255, green: 148/255, blue: 37/255, alpha: 1)
            PLabel.textColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        }
        if grade == "S"{
            NSLayoutConstraint.activate([
                HDLabel.rightAnchor.constraint(equalTo: DLabel.leftAnchor, constant: -10),
                HDLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
                HDLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.16),
                HDLabel.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.16)
                ])
        }else{
            NSLayoutConstraint.activate([
                HDLabel.rightAnchor.constraint(equalTo: DLabel.leftAnchor, constant: -10),
                HDLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
                HDLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
                HDLabel.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1)
                ])
            HDLabel.backgroundColor = UIColor(red: 37/255, green: 148/255, blue: 0/255, alpha: 1)
            HDLabel.textColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        }
        if grade == "D"{
            NSLayoutConstraint.activate([
                NLabel.leftAnchor.constraint(equalTo: PLabel.rightAnchor, constant: 10),
                NLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
                NLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.16),
                NLabel.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.16)
                ])
        }else{
            NSLayoutConstraint.activate([
                NLabel.leftAnchor.constraint(equalTo: PLabel.rightAnchor, constant: 10),
                NLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
                NLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
                NLabel.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1)
                ])
            NLabel.backgroundColor = UIColor(red: 185/255, green: 74/255, blue: 0/255, alpha: 1)
            NLabel.textColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        }
    }
    
   
    
    
    
}

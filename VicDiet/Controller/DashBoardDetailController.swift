//
//  DashBoardDetailController.swift
//  VicDiet
//
//  Created by Ming Yang on 22/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class DashBoardDetailController: UITableViewController {

    var homePageController: HomePageController?
    var intakeProgressObject = IntakeProgressObject(proteinProgress: 0, calciumProgress: 0, totalFatProgress: 0, sodiumProgress: 0, vitaminCProgress: 0, vitaminAProgress: 0, progressMark: 0)
    var targetPersonGroupList = [AveragePersonGroupObject]()
    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("X", for: .normal)
        //button.setTitleColor(UIColor(red: 125/255, green: 206/255, blue: 148/255, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        
        return button
    }()
    
    @objc func handleCancel(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 153/255, blue: 0/255, alpha: 1)
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationController?.navigationBar.barTintColor = UIColor.green
        
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor(red: 255/255, green: 153/255, blue: 0/255, alpha: 1)
        tableView.register(MarkCell.self, forCellReuseIdentifier: "MarkCell")
        tableView.register(MarkInstructionCell.self, forCellReuseIdentifier: "MarkInstructionCell")
        
        tableView.register(NutrientProgressCell.self, forCellReuseIdentifier: "NutrientProgressCell0")
        tableView.register(NutrientProgressCell.self, forCellReuseIdentifier: "NutrientProgressCell1")
        tableView.register(NutrientProgressCell.self, forCellReuseIdentifier: "NutrientProgressCell2")
        tableView.register(NutrientProgressCell.self, forCellReuseIdentifier: "NutrientProgressCell3")
        tableView.register(NutrientProgressCell.self, forCellReuseIdentifier: "NutrientProgressCell4")
        tableView.register(NutrientProgressCell.self, forCellReuseIdentifier: "NutrientProgressCell5")
        setupAdditionalViews()
    }

    func setupAdditionalViews(){
        cancelButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: cancelButton)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        if section == 1{
            return 1
        }else{
            return 6
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return self.view.frame.height*0.4
        }
        if indexPath.section == 1{
            return self.view.frame.height*0.25
        }else{
            return self.view.frame.height*0.4
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MarkCell", for: indexPath) as! MarkCell
            cell.circularPath = UIBezierPath(arcCenter: cell.center, radius: min(cell.frame.width/2,cell.frame.height)/2, startAngle: CGFloat(-1.3 * .pi), endAngle: 0.3*CGFloat.pi, clockwise: true)
            
            cell.setupCellView(percentageProgress: CGFloat(intakeProgressObject.progressMark), markFrame: CGRect(x: cell.frame.width/2 - cell.frame.width/12, y: cell.frame.height/2 - cell.frame.height/10, width: cell.frame.width/6, height: cell.frame.height/5), textFrame: CGRect(x: cell.frame.width/2 - cell.frame.width/7, y: cell.frame.height/2 + cell.frame.height/10, width: cell.frame.width/3.5, height: cell.frame.height/6))
            
            return cell
        }
        if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MarkInstructionCell", for: indexPath) as! MarkInstructionCell
            let mark = intakeProgressObject.progressMark*100
            if mark < 50{
                cell.setupCellView(grade: "D")
            }
            if mark >= 50 && mark < 60{
                cell.setupCellView(grade: "C")
            }
            if mark >= 60 && mark < 70{
                cell.setupCellView(grade: "B")
            }
            if mark >= 70 && mark < 80{
                cell.setupCellView(grade: "A")
            }
            if mark >= 80{
                cell.setupCellView(grade: "S")
            }
            return cell
        }else{
            switch indexPath.row {
            case 0:
                var progress = Float(intakeProgressObject.proteinProgress/Double(truncating: targetPersonGroupList[0].protein))
                let cell = setupSectionThreeCell(tableView: self.tableView, indexPath: indexPath, cellTopLeftLabel: "Protein",progress: progress,identifier: "NutrientProgressCell0")
                return cell
            case 1:
                var progress = Float(intakeProgressObject.calciumProgress/Double(truncating: targetPersonGroupList[0].calcium))
//                if progress >= 1{
//                    progress = 1
//                }
                let cell = setupSectionThreeCell(tableView: self.tableView, indexPath: indexPath, cellTopLeftLabel: "Calcium",progress: progress,identifier: "NutrientProgressCell1")
                return cell
            case 2:
                var progress = Float(intakeProgressObject.totalFatProgress/Double(truncating: targetPersonGroupList[0].totalFat))
//                if progress >= 1{
//                    progress = 1
//                }
                let cell = setupSectionThreeCell(tableView: self.tableView, indexPath: indexPath, cellTopLeftLabel: "Fat",progress: progress,identifier: "NutrientProgressCell2")
                return cell
            case 3:
                var progress = Float(intakeProgressObject.sodiumProgress/Double(truncating: targetPersonGroupList[0].sodium))
//                if progress >= 1{
//                    progress = 1
//                }
                let cell = setupSectionThreeCell(tableView: self.tableView, indexPath: indexPath, cellTopLeftLabel: "Sodium",progress: progress,identifier: "NutrientProgressCell3")
                return cell
            case 4:
                var progress = Float(intakeProgressObject.vitaminCProgress/Double(truncating: targetPersonGroupList[0].vitaminC))
//                if progress >= 1{
//                    progress = 1
//                }
                let cell = setupSectionThreeCell(tableView: self.tableView, indexPath: indexPath, cellTopLeftLabel: "Vitamin C",progress: progress,identifier: "NutrientProgressCell4")
                return cell
            default:
                var progress = Float(intakeProgressObject.vitaminAProgress/Double(truncating: targetPersonGroupList[0].vitaminA))
//                if progress >= 1{
//                    progress = 1
//                }
                let cell = setupSectionThreeCell(tableView: self.tableView, indexPath: indexPath, cellTopLeftLabel: "Vitamin A",progress: progress,identifier: "NutrientProgressCell5")
                return cell
            }
        }
    }
 
    func setupSectionThreeCell(tableView: UITableView, indexPath: IndexPath, cellTopLeftLabel: String, progress: Float, identifier: String) -> (NutrientProgressCell){
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! NutrientProgressCell
        cell.topLeftLabel.text = cellTopLeftLabel
        if progress <= 0.33{
            cell.middleKeyLabel.text = "Very Low"
        }
        if progress > 0.33 && progress <= 0.90{
            cell.middleKeyLabel.text = "Low"
        }
        if progress > 0.90 && progress <= 1{
            cell.middleKeyLabel.text = "High"
        }
        if progress > 1{
            cell.middleKeyLabel.text = "Over Intake"
            cell.middleKeyLabel.textColor = .red
            cell.progressView.progressTintColor = .red
            cell.progressTrackLabel.backgroundColor = .red
        }
        if progress <= 1{
            cell.progressTrackLabel.text = "\(Double(Int(progress*1000))/10)%"
            cell.progressView.setProgress(progress, animated: true)
        }else{
            cell.progressTrackLabel.text = "\(Double(Int(progress*1000))/10)%"
            cell.progressView.setProgress(1, animated: true)
        }

        
        var progressForTrackLabel = Float(1)
        if progress <= 1{
            progressForTrackLabel = progress
        }
        
        cell.addSubview(cell.progressTrackLabel)
        cell.progressTrackLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cell.progressTrackLabel.bottomAnchor.constraint(equalTo: cell.progressView.topAnchor, constant: -10),
            cell.progressTrackLabel.centerXAnchor.constraint(equalTo: cell.progressView.leadingAnchor, constant: CGFloat(progressForTrackLabel*0.7)*cell.frame.width),
            cell.progressTrackLabel.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 0.08),
            cell.progressTrackLabel.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 0.18)
            ])
        return cell
    }
    
    
}

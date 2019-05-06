//
//  SwipingPhysicalInputController.swift
//  VicDiet
//
//  Created by Ming Yang on 1/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit
import Firebase

struct Page {
    let imageName: String
    let headerText: String
    let bodyText: String
}

struct PhysicalInfo {
    static var age = "Blank"
    static var gender = "Blank"
    static var weight = "Blank"
}

class SwipingPhysicalInputView: UIView, UICollectionViewDataSource, UICollectionViewDelegate,UITextFieldDelegate, UICollectionViewDelegateFlowLayout{
    
    
    var guidanceLauncher: GuidanceLauncher?
    
    
    //var swippingTextDict: SwippingTextDict?
    
    var age: String?
    var isPass = false
    
    
    var gender = "Male"
    var weight: String?
    let ref = Database.database().reference().child("User").child("reuserableUser")
    
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //cv.backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 103/255, alpha: 1)
        //cv.backgroundColor = UIColor(red: 125/255, green: 206/255, blue: 148/255, alpha: 1)
        cv.backgroundColor = .brown
        cv.dataSource = self
        cv.delegate = self
        
        cv.isScrollEnabled = false
        cv.isPagingEnabled = true
        
        
        
        return cv
        
    }()
    
    
    
    let pages = [
        Page(imageName: "swipingPageImage", headerText: "What is your birthday?", bodyText: "Please choose your birthday here"),
        Page(imageName: "swipingPageImage", headerText: "What is your gender?", bodyText: "You should input your gender here: (\("Male") or \("Female"))"),
        Page(imageName: "swipingPageImage", headerText: "What is your weight?", bodyText: "You should input your weight in \("Kg")")
        
    ]
    
    
    
//    let imageName = ["swipingPageImage","swipingPageImage","swipingPageImage"]
//    let headerStrings = ["Let us know your age.", "What is your gender?", "How heavy are you?"]
    
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        
        return button
    }()
    @objc private func handlePrev(){
        
        if(pageControl.currentPage == 0){
            UIView.animate(withDuration: 0.2, animations: {self.guidanceLauncher?.blackView.alpha = 0})
        }else{
            let prevIndex = max(pageControl.currentPage - 1, 0)
            
            let indexPath = IndexPath(item: prevIndex, section: 0)
            
            pageControl.currentPage = prevIndex
            
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
     
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.purple, for: .normal)
        
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        
        return button
    }()
    

    
    func displayMessage(_ message: String,_ title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        
        alertController.show()
        //self.guidanceLauncher?.homePageController?.present(alertController, animated: true, completion: nil)
        
    }
    
    
    @objc private func handleNext(){
        self.endEditing(true)
        
        if(pageControl.currentPage + 1 == pages.count){

            
            if let currentCell = self.guidanceLauncher?.swipingPhysicalInputView.collectionView.cellForItem(at: IndexPath(item: 2, section: 0)) as? SwipingPhysicalInputPageWeightCell{
                
                
                weight = currentCell.inputTextField.text
                
                if(Double(weight!) != nil){
                    if currentCell.weightSelection.selectedSegmentIndex == 0{
                        weight = String(Double(weight!)!*1.0)
                    }else{
                        weight = String(Double(weight!)!*0.4532)
                    }
                    
                    UIView.animate(withDuration: 0.2, animations: {self.guidanceLauncher?.blackView.alpha = 0})
                    let indexPath = IndexPath(item: 0, section: 0)
                    pageControl.currentPage = 0
                    collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                    //firebase write
                    ref.child("Age").setValue(age)
                    ref.child("Gender").setValue(gender)
                    ref.child("Weight").setValue(weight)

                    
                self.guidanceLauncher?.homePageController?.collectionView.reloadData()
           
                    
                }else{
                    displayMessage("Weight input is not a number!","Input Error")
                }
                
            }
            
        } else{
            if let currentCell = self.guidanceLauncher?.swipingPhysicalInputView.collectionView.cellForItem(at: IndexPath(item: pageControl.currentPage, section: 0)){
                if (pageControl.currentPage == 0){
                    if(age != nil && isPass) {
                        if Int(age!)! <= 150{
                            let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
                            let indexPath = IndexPath(item: nextIndex, section: 0)
                            pageControl.currentPage = nextIndex
                            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                        }else{
                            displayMessage("We can only handle the age from 0 to 150!","Birthday Error")
                        }
                        
                    }else if (age != nil && !isPass){
                        displayMessage("You cannot be born on this date!","Birthday Error")
                    }else if(age == nil){
                        displayMessage("You haven't pick any date right now","Birthday Error")
                    }
                }else{
                    if(gender.lowercased() == "male") || (gender.lowercased() == "female"){
                        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
                        let indexPath = IndexPath(item: nextIndex, section: 0)
                        pageControl.currentPage = nextIndex
                        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                    }else{
                        displayMessage("Gender input is not valid!","Input Error")
                    }
                }
            }
        }
    }
    
    
    
    lazy var pageControl: UIPageControl = {
        
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .orange
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 244/255, alpha: 1)
        
        return pc
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .yellow
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        setupBottomControls()
        collectionView.backgroundColor = .white
        collectionView.register(SwipingPhysicalInputPageAgeCell.self, forCellWithReuseIdentifier: "cellId0")
        collectionView.register(SwipingPhysicalInputPageGenderCell.self, forCellWithReuseIdentifier: "cellId1")
        collectionView.register(SwipingPhysicalInputPageWeightCell.self, forCellWithReuseIdentifier: "cellId2")
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func yearsBetweenDate(startDate: Date, endDate: Date) -> (duration:String, isPast: Bool) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: startDate, to: endDate)
        
        return (String(components.year!), (endDate >= startDate))
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatterDisplay = DateFormatter()
        dateFormatterDisplay.dateFormat = "dd-MM-yyyy"
        if let currentCell = self.guidanceLauncher?.swipingPhysicalInputView.collectionView.cellForItem(at: IndexPath(item: 0, section: 0)) as? SwipingPhysicalInputPageAgeCell{
            currentCell.inputTextField.text = dateFormatterDisplay.string(from: datePicker.date)
            self.age = self.yearsBetweenDate(startDate: datePicker.date, endDate: Date()).duration
            self.isPass = self.yearsBetweenDate(startDate: datePicker.date, endDate: Date()).isPast
        }
    }
    @objc func handleWeightMetric(sender: UISegmentedControl){
        if let currentCell = self.guidanceLauncher?.swipingPhysicalInputView.collectionView.cellForItem(at: IndexPath(item: 2, section: 0)) as? SwipingPhysicalInputPageWeightCell{
            switch sender.selectedSegmentIndex {
            case 1:
                currentCell.weightTextView.attributedText = NSMutableAttributedString(string: "Lbs", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
                
                
                
                print("Lbs")
            default:
                currentCell.weightTextView.attributedText = NSMutableAttributedString(string: "Kg", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
                print("Kg")
            }
        }
        
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(indexPath.item == 0){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId0", for: indexPath) as! SwipingPhysicalInputPageAgeCell
            
            cell.inputTextField.tag = indexPath.item
            cell.inputTextField.delegate = self
            
            let page = pages[indexPath.item]
            cell.page = page
            
            cell.inputTextField.inputView = cell.datePicker
            cell.datePicker?.addTarget(self, action: #selector(self.dateChanged(datePicker:)), for: .valueChanged)
            return cell
        }else if(indexPath.item == 2){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId2", for: indexPath) as! SwipingPhysicalInputPageWeightCell
            cell.inputTextField.rightView = cell.weightTextView
            cell.inputTextField.rightViewMode = .always
            
            cell.inputTextField.tag = indexPath.item
            cell.inputTextField.delegate = self
            
            
            let inputConsoleView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height/10))
            inputConsoleView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            cell.inputTextField.inputAccessoryView = inputConsoleView
            inputConsoleView.addSubview(cell.weightSelection)
            cell.weightSelection.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                cell.weightSelection.topAnchor.constraint(equalTo: inputConsoleView.topAnchor, constant: cell.frame.height/50),
                cell.weightSelection.leftAnchor.constraint(equalTo: inputConsoleView.leftAnchor, constant: cell.frame.width/5),
                cell.weightSelection.rightAnchor.constraint(equalTo: inputConsoleView.rightAnchor, constant: -cell.frame.width/5),
                cell.weightSelection.bottomAnchor.constraint(equalTo: inputConsoleView.bottomAnchor, constant: -cell.frame.height/50)
                ])
            cell.weightSelection.addTarget(self, action: #selector(handleWeightMetric(sender:)), for: .valueChanged)
            
            let page = pages[indexPath.item]
            cell.page = page
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId1", for: indexPath) as! SwipingPhysicalInputPageGenderCell
            cell.genderSelection.addTarget(self, action: #selector(handleSelectGender), for: .valueChanged)
            let page = pages[indexPath.item]
            cell.page = page
            return cell
        }
    }
    
    @objc func handleSelectGender(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            gender = "Male"
            print("Male")
        case 1:
            gender = "Female"
            print("Female")
        default:
            gender = "Male"
            print("Male")
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.move().x / self.frame.width
        //print(targetContentOffset.move().x)
        //print(self.frame.width)
        pageControl.currentPage = Int(index)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
 
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    
    fileprivate func setupBottomControls(){
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton,pageControl,nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        addSubview(bottomControlsStackView)
        NSLayoutConstraint.activate([
            bottomControlsStackView.topAnchor.constraint(equalTo: self.topAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1)
            ])
        //print(self.frame.height/20)
        
    }
    
}

public extension UIAlertController {
    func show() {
        let win = UIWindow(frame: UIScreen.main.bounds)
        let vc = UIViewController()
        vc.view.backgroundColor = .clear
        win.rootViewController = vc
        win.windowLevel = UIWindow.Level.alert + 1
        win.makeKeyAndVisible()
        vc.present(self, animated: true, completion: nil)
    }
}

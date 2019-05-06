//
//  HomePageController.swift
//  VicDiet
//
//  Created by Ming Yang on 2/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit
import Firebase

let navigationTitles = ["Home","Me"]

class HomePageController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    let logOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("LOG OUT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        //button.addTarget(self, action: #selector(handleLogOut), for: .touchUpInside)
        return button
    }()
    var guidanceLauncher: GuidanceLauncher?
    var foodIntakeTodayList = [FoodObject]()
    var mealObjectList = [MealObject]()
    //var personGroupList = [AveragePersonGroupObject]()
    var intakeProgressObject = IntakeProgressObject(proteinProgress: 0, calciumProgress: 0, totalFatProgress: 0, sodiumProgress: 0, vitaminCProgress: 0, vitaminAProgress: 0, progressMark: 0)
    var intakeRestProgressObject = IntakeProgressObject(proteinProgress: 0, calciumProgress: 0, totalFatProgress: 0, sodiumProgress: 0, vitaminCProgress: 0, vitaminAProgress: 0, progressMark: 0)
    var targetPersonGroupList = [AveragePersonGroupObject]()
    var userBasicInfo: UserBasicInfoObject?
    lazy var mainMenuBar: MainMenuBar = {
        let mmb = MainMenuBar()
        mmb.homePageController = self
        return mmb
    }()
    
    let firstCellId = "firstCellId"
    //let secondCellId = "secondCellId"
    //let thirdCellId = "thirdCellId"
    let forthCellId = "forthCellId"
    
    var guideViewCounter: Int = 0
    let homePageGuideViewFirst: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        view.alpha = 0
        return view
    }()
    
    
    var physicalInputGuideView: PhysicalInputGuideView?
    var progressLevelGuideView: ProgressLevelGuideView?
    var foodIntakeTodayGuideView: FoodIntakeTodayGuideView?
    var mainMenuHomeGuideView: MainMenuHomeGuideView?
    var mainMenuMeGuideView: MainMenuMeGuideView?
    var mainMenuAddGuideView: MainMenuAddGuideView?
    
    //[0,0,0,0] = [addFood,addSubstitute,addMeal,mealPlanner]
    var addButtonFirstClick = [0,0,0,0]
    
    var fixedDimensionalArray = [ExpandableNames]()
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        logOutButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logOutButton)
        logOutButton.addTarget(self, action: #selector(handleLogOut), for: .touchUpInside)
        
        collectionView.isScrollEnabled = false
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadList(notification:)), name: NSNotification.Name(rawValue: "reloadHomePageData"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(loadNewGuideView(notification:)), name: NSNotification.Name(rawValue: "showPossibleGuideView"), object: nil)
        
        //guidanceLauncher = GuidanceLauncher()
        //guidanceLauncher?.homePageController = self
        mainMenuBar.homePageController = self
        navigationItem.title = "Home"
        setupGuidanceBarButtons()
        setupCollectionView()
        setupBottomMenu()
        updateUserInfoAndTargetPersonGroup()
        

        
  
        
        
        if (!(UserDefaults.standard.bool(forKey: "everLaunched"))) {
            UserDefaults.standard.set(true, forKey:"everLaunched")
           NotificationCenter.default.post(name: NSNotification.Name("showPossibleGuideView"), object: nil)
            
        }
        
        
    }
    
    @objc func handleDismiss(){
        self.physicalInputGuideView?.alpha = 0
        self.progressLevelGuideView?.alpha = 0
        self.foodIntakeTodayGuideView?.alpha = 0
        self.mainMenuHomeGuideView?.alpha = 0
        self.mainMenuMeGuideView?.alpha = 0
        self.mainMenuAddGuideView?.alpha = 0
    }
    
    @objc func loadNewGuideView(notification: NSNotification) {
        UIView.animate(withDuration: 0.2, animations: {
            self.showPhysicalInputGuide()
        })
       
    }
    
    

    
    func showPhysicalInputGuide(){
        if let window = UIApplication.shared.keyWindow{
            self.physicalInputGuideView = PhysicalInputGuideView(frame: window.frame)
            window.addSubview(self.physicalInputGuideView!)
            self.physicalInputGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismissPhysicalInputGuide)))
            self.physicalInputGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
            UIView.animate(withDuration: 0.5, animations: {self.physicalInputGuideView!.alpha = 1})
        }
    }
    @objc func handleDismissPhysicalInputGuide(){
        UIView.animate(withDuration: 0.2, animations: {
            self.physicalInputGuideView?.alpha = 0
            
            if let window = UIApplication.shared.keyWindow{
                self.progressLevelGuideView = ProgressLevelGuideView(frame: window.frame)
                window.addSubview(self.progressLevelGuideView!)
                self.progressLevelGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismissProgressLevelGuide)))
                self.progressLevelGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
                UIView.animate(withDuration: 0.5, animations: {self.progressLevelGuideView!.alpha = 1})
            }
            
        })
    }
    
    @objc func handleDismissProgressLevelGuide(){
        UIView.animate(withDuration: 0.2, animations: {
            self.progressLevelGuideView?.alpha = 0
            if let window = UIApplication.shared.keyWindow{
                self.foodIntakeTodayGuideView = FoodIntakeTodayGuideView(frame: window.frame)
                window.addSubview(self.foodIntakeTodayGuideView!)
                self.foodIntakeTodayGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismissFoodIntakeTodayGuide)))
                self.foodIntakeTodayGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
                UIView.animate(withDuration: 0.5, animations: {self.foodIntakeTodayGuideView!.alpha = 1})
            }
        })
    }
    
    @objc func handleDismissFoodIntakeTodayGuide(){
        UIView.animate(withDuration: 0.2, animations: {
            self.foodIntakeTodayGuideView?.alpha = 0
            if let window = UIApplication.shared.keyWindow{
                self.mainMenuHomeGuideView = MainMenuHomeGuideView(frame: window.frame)
                window.addSubview(self.mainMenuHomeGuideView!)
                self.mainMenuHomeGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismissMainMenuHomeGuide)))
                self.mainMenuHomeGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
                UIView.animate(withDuration: 0.5, animations: {self.mainMenuHomeGuideView!.alpha = 1})
            }
        })
    }
    @objc func handleDismissMainMenuHomeGuide(){
        UIView.animate(withDuration: 0.2, animations: {
            self.mainMenuHomeGuideView?.alpha = 0
            if let window = UIApplication.shared.keyWindow{
                self.mainMenuMeGuideView = MainMenuMeGuideView(frame: window.frame)
                window.addSubview(self.mainMenuMeGuideView!)
                self.mainMenuMeGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismissMainMenuMeGuide)))
                self.mainMenuMeGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
                UIView.animate(withDuration: 0.5, animations: {self.mainMenuMeGuideView!.alpha = 1})
            }
        })
    }
    @objc func handleDismissMainMenuMeGuide(){
        UIView.animate(withDuration: 0.2, animations: {
            self.mainMenuMeGuideView?.alpha = 0
            if let window = UIApplication.shared.keyWindow{
                self.mainMenuAddGuideView = MainMenuAddGuideView(frame: window.frame)
                window.addSubview(self.mainMenuAddGuideView!)
                self.mainMenuAddGuideView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismissMainMenuAddGuide)))
                self.mainMenuAddGuideView?.skipOutButton.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
                UIView.animate(withDuration: 0.5, animations: {self.mainMenuAddGuideView!.alpha = 1})
            }
        })
    }
    @objc func handleDismissMainMenuAddGuide(){
        UIView.animate(withDuration: 0.2, animations: {
            self.mainMenuAddGuideView?.alpha = 0
            
        })
    }
    
    
    
    @objc func handleLogOut(){
        print("sss")
        
        do {
            try Auth.auth().signOut()
        } catch{
            
        }
        let logInPage = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "LogInViewController") as? LogInViewController
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = logInPage
        
        
    }
    
    func setupCollectionView(){
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        collectionView?.backgroundColor = UIColor.lightGray
        collectionView?.register(HomePageFirstCell.self, forCellWithReuseIdentifier: firstCellId)
        //collectionView?.register(FoodCell.self, forCellWithReuseIdentifier: secondCellId)
        //collectionView?.register(TipsCell.self, forCellWithReuseIdentifier: thirdCellId)
        collectionView?.register(MeCell.self, forCellWithReuseIdentifier: forthCellId)
        collectionView?.contentInset = UIEdgeInsets(top: -15, left: 0, bottom: 0, right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView?.isPagingEnabled = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.item == 0){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: firstCellId, for: indexPath) as! HomePageFirstCell
            cell.backgroundColor = UIColor.white
            cell.homePageController = self
            cell.tableViewInFirstPage.reloadData()
            return cell
        }
//        if (indexPath.item == 1){
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: secondCellId, for: indexPath) as! FoodCell
//            cell.navigationController = self.navigationController
//            cell.homePageController = self
//            cell.backgroundColor = UIColor.white
//            return cell
//        }
//        if (indexPath.item == 2){
//
//        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: forthCellId, for: indexPath) as! MeCell

        
        cell.backgroundColor = UIColor.white
        cell.homePageController = self
        cell.collectionViewNestedFirst.reloadData()
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 35 - (self.navigationController?.navigationBar.frame.height)!)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
//    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        let index = targetContentOffset.move().x / view.frame.width
//        if index > 0{
//            let indexPath = NSIndexPath(item: Int(index)+1, section: 0)
//            let previousCell = mainMenuBar.collectionView.cellForItem(at: mainMenuBar.previousIndexClicked!) as! MenuCell
//            previousCell.imageView.image = UIImage(named: mainMenuBar.imageNames[mainMenuBar.previousIndexClicked!.item])
//            let cell = mainMenuBar.collectionView.cellForItem(at: indexPath as IndexPath) as! MenuCell
//            cell.imageView.image = UIImage(named: mainMenuBar.selectedImages[indexPath.item])
//            mainMenuBar.previousIndexClicked = indexPath as IndexPath
//            navigationItem.title = navigationTitles[indexPath.item - 1]
//        }else{
//            let indexPath = NSIndexPath(item: Int(index), section: 0)
//            let previousCell = mainMenuBar.collectionView.cellForItem(at: mainMenuBar.previousIndexClicked!) as! MenuCell
//            previousCell.imageView.image = UIImage(named: mainMenuBar.imageNames[mainMenuBar.previousIndexClicked!.item])
//            let cell = mainMenuBar.collectionView.cellForItem(at: indexPath as IndexPath) as! MenuCell
//            cell.imageView.image = UIImage(named: mainMenuBar.selectedImages[indexPath.item])
//            mainMenuBar.previousIndexClicked = indexPath as IndexPath
//            navigationItem.title = navigationTitles[indexPath.item]
//        }
//        
//    }
    
    func scrollToMainMenuIndex(menuIndex: Int){
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
    }
    
    func updateUserInfoAndTargetPersonGroup(){
        Service.sharedInstance.fetchUser { (userBasicInfoObject) in
            self.foodIntakeTodayList = [FoodObject]()
            self.mealObjectList = [MealObject]()
            self.intakeProgressObject = IntakeProgressObject(proteinProgress: 0, calciumProgress: 0, totalFatProgress: 0, sodiumProgress: 0, vitaminCProgress: 0, vitaminAProgress: 0, progressMark: 0)
            self.userBasicInfo = userBasicInfoObject
            NotificationCenter.default.post(name: NSNotification.Name("reloadHomePageData"), object: nil)
            Service.sharedInstance.fetchAllPersonGroupStandard { (personGroupList) in
                var target = [AveragePersonGroupObject]()
                for i in 0...(personGroupList.count - 1){
                    if Double(exactly: personGroupList[i].ageLower)! <= Double(exactly: (self.userBasicInfo?.age)!)! && Double(exactly: personGroupList[i].ageUpper)! >= Double(exactly: (self.userBasicInfo?.age)!)! && personGroupList[i].gender.lowercased() == self.userBasicInfo?.gender.lowercased(){
                        target.append(personGroupList[i])
                        break
                    }
                }
                self.targetPersonGroupList = target
                print("Target user standard is matched based on the current user!")
                NotificationCenter.default.post(name: NSNotification.Name("reloadHomePageData"), object: nil)
            }
        }
    }
    
    func setupGuidanceBarButtons(){
        let guidanceImage = UIImage(named: "icon_guidance")?.withRenderingMode((.alwaysOriginal))
        let guidanceBarButtonItem = UIBarButtonItem(image: guidanceImage, style: .plain, target: self, action: #selector(handleGuidance))
        navigationItem.rightBarButtonItem = guidanceBarButtonItem
    }
    
    @objc func handleGuidance(){
        guidanceLauncher = GuidanceLauncher()
        guidanceLauncher?.showGuidance()
        guidanceLauncher?.homePageController = self
    }
    
    fileprivate func setupBottomMenu(){
        let bottomControlsStackView = UIStackView(arrangedSubviews: [mainMenuBar])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 55)
            ])
  
    }
    
    @objc func loadList(notification: NSNotification) {
        updateIntakeProgress()
        self.collectionView.reloadData()
    }
    
    func updateIntakeProgress(){
        let intakeProgressObject = IntakeProgressObject(proteinProgress: 0, calciumProgress: 0, totalFatProgress: 0, sodiumProgress: 0, vitaminCProgress: 0, vitaminAProgress: 0, progressMark: 0)
        let intakeRestProgressObject = IntakeProgressObject(proteinProgress: 0, calciumProgress: 0, totalFatProgress: 0, sodiumProgress: 0, vitaminCProgress: 0, vitaminAProgress: 0, progressMark: 0)
        if foodIntakeTodayList.count == 0 && self.targetPersonGroupList.count == 0{
            self.intakeProgressObject = intakeProgressObject
            
            
            return
        }
        if foodIntakeTodayList.count == 0 && self.targetPersonGroupList.count > 0{
            self.intakeProgressObject = intakeProgressObject
            self.intakeRestProgressObject.proteinProgress = Double(truncating: self.targetPersonGroupList[0].protein)
            self.intakeRestProgressObject.calciumProgress = Double(truncating: self.targetPersonGroupList[0].calcium)
            self.intakeRestProgressObject.totalFatProgress = Double(truncating: self.targetPersonGroupList[0].totalFat)
            self.intakeRestProgressObject.sodiumProgress = Double(truncating: self.targetPersonGroupList[0].sodium)
            self.intakeRestProgressObject.vitaminCProgress = Double(truncating: self.targetPersonGroupList[0].vitaminC)
            self.intakeRestProgressObject.vitaminAProgress = Double(truncating: self.targetPersonGroupList[0].vitaminA)
            self.intakeRestProgressObject.progressMark = 1
            
            print("Progess Mark: ",self.intakeProgressObject.progressMark*100," Points")
            print("Rest Progess Mark: ",self.intakeRestProgressObject.progressMark*100," Points")
            return
        }
        
        for i in 0...foodIntakeTodayList.count - 1{
            intakeProgressObject.proteinProgress = intakeProgressObject.proteinProgress + Double(truncating: self.foodIntakeTodayList[i].protein)
            intakeProgressObject.calciumProgress = Double(truncating: self.foodIntakeTodayList[i].calcium) + intakeProgressObject.calciumProgress
            intakeProgressObject.totalFatProgress = intakeProgressObject.totalFatProgress + Double(truncating: self.foodIntakeTodayList[i].totalFat)
            intakeProgressObject.sodiumProgress = intakeProgressObject.sodiumProgress + Double(truncating: self.foodIntakeTodayList[i].sodium)
            intakeProgressObject.vitaminCProgress = intakeProgressObject.vitaminCProgress + Double(truncating: self.foodIntakeTodayList[i].vitaminC)
            intakeProgressObject.vitaminAProgress = intakeProgressObject.vitaminAProgress + Double(truncating: self.foodIntakeTodayList[i].vitaminA)
            
            
            intakeRestProgressObject.proteinProgress = Double(truncating: self.targetPersonGroupList[0].protein) - intakeProgressObject.proteinProgress
            intakeRestProgressObject.calciumProgress = Double(truncating: self.targetPersonGroupList[0].calcium) - intakeProgressObject.calciumProgress
            intakeRestProgressObject.totalFatProgress = Double(truncating: self.targetPersonGroupList[0].totalFat) - intakeProgressObject.totalFatProgress
            intakeRestProgressObject.sodiumProgress = Double(truncating: self.targetPersonGroupList[0].sodium) - intakeProgressObject.sodiumProgress
            intakeRestProgressObject.vitaminCProgress = Double(truncating: self.targetPersonGroupList[0].vitaminC) - intakeProgressObject.vitaminCProgress
            intakeRestProgressObject.vitaminAProgress = Double(truncating: self.targetPersonGroupList[0].vitaminA) - intakeProgressObject.vitaminAProgress
            if intakeRestProgressObject.proteinProgress < 0{
                intakeRestProgressObject.proteinProgress = 0
            }
            if intakeRestProgressObject.calciumProgress < 0{
                intakeRestProgressObject.calciumProgress = 0
            }
            if intakeRestProgressObject.sodiumProgress < 0{
                intakeRestProgressObject.sodiumProgress = 0
            }
            if intakeRestProgressObject.totalFatProgress < 0{
                intakeRestProgressObject.totalFatProgress = 0
            }
            if intakeRestProgressObject.vitaminCProgress < 0{
                intakeRestProgressObject.vitaminCProgress = 0
            }
            if intakeRestProgressObject.vitaminAProgress < 0{
                intakeRestProgressObject.vitaminAProgress = 0
            }
            
        }
        var proteinPercent = intakeProgressObject.proteinProgress/Double(truncating: self.targetPersonGroupList[0].protein)
        var calciumPercent = intakeProgressObject.calciumProgress/Double(truncating: self.targetPersonGroupList[0].calcium)
        var totalFatPercent = intakeProgressObject.totalFatProgress/Double(truncating: self.targetPersonGroupList[0].totalFat)
        var sodiumPercent = intakeProgressObject.sodiumProgress/Double(truncating: self.targetPersonGroupList[0].sodium)
        var CPercent = intakeProgressObject.vitaminCProgress/Double(truncating: self.targetPersonGroupList[0].vitaminC)
        var APercent = intakeProgressObject.vitaminAProgress/Double(truncating: self.targetPersonGroupList[0].vitaminA)
//        
//        var proteinRestPercent = intakeRestProgressObject.proteinProgress/Double(truncating: self.targetPersonGroupList[0].protein)
//        var calciumRestPercent = intakeRestProgressObject.calciumProgress/Double(truncating: self.targetPersonGroupList[0].calcium)
//        var totalFatRestPercent = intakeRestProgressObject.totalFatProgress/Double(truncating: self.targetPersonGroupList[0].totalFat)
//        var sodiumRestPercent = intakeRestProgressObject.sodiumProgress/Double(truncating: self.targetPersonGroupList[0].sodium)
//        var CRestPercent = intakeRestProgressObject.vitaminCProgress/Double(truncating: self.targetPersonGroupList[0].vitaminC)
//        var ARestPercent = intakeRestProgressObject.vitaminAProgress/Double(truncating: self.targetPersonGroupList[0].vitaminA)
//        
        if proteinPercent > 1{
            proteinPercent = 1
        }
        if calciumPercent > 1{
            calciumPercent = 1
        }
        if totalFatPercent > 1{
            totalFatPercent = 1
        }
        if sodiumPercent > 1{
            sodiumPercent = 1
        }
        if CPercent > 1{
            CPercent = 1
        }
        if APercent > 1{
            APercent = 1
        }
        let average = (proteinPercent + calciumPercent +
            totalFatPercent + sodiumPercent + CPercent +
            APercent)/6
        let averageRest = 1 - average
        intakeProgressObject.progressMark = average
        intakeRestProgressObject.progressMark = averageRest
        self.intakeProgressObject = intakeProgressObject
        self.intakeRestProgressObject = intakeRestProgressObject
        print("Progess Mark: ",self.intakeProgressObject.progressMark*100," Points")
        print("Rest Progess Mark: ",self.intakeRestProgressObject.progressMark*100," Points")
    }
    
}
extension UINavigationController {
    
    func popToViewControllerOfType(classForCoder: AnyClass) {
        for controller in viewControllers {
            if controller.classForCoder == classForCoder {
                popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    func popViewControllers(controllersToPop: Int, animated: Bool) {
        if viewControllers.count > controllersToPop {
            popToViewController(viewControllers[viewControllers.count - (controllersToPop + 1)], animated: animated)
        } else {
            print("Trying to pop \(controllersToPop) view controllers but navigation controller contains only \(viewControllers.count) controllers in stack")
        }
    }
}




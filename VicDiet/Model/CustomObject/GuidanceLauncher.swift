//
//  GuidanceLauncher.swift
//  VicDiet
//
//  Created by Ming Yang on 7/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class GuidanceLauncher: NSObject{

    var homePageController: HomePageController?
    
    override init() {
        super.init()
        swipingPhysicalInputView.guidanceLauncher = self
        
    }
        //It is used to present swipping pages guidance view
    let blackView = UIView()
    
    
    var swipingPhysicalInputView = SwipingPhysicalInputView()
    
    
    @objc func keyboardWillAppear() {
        //Do something here
        blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismissBlackViewKeyboard)))

    }

    @objc func keyboardWillDisappear() {
        //Do something here
        blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismissGuidance)))
    }
    
    @objc func showGuidance(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        if let window = UIApplication.shared.keyWindow{
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismissGuidance)))
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            window.addSubview(blackView)
                
            blackView.addSubview(swipingPhysicalInputView)
            swipingPhysicalInputView.frame = CGRect(x: 35, y: 35, width: window.frame.width-70, height: window.frame.height-70)
            blackView.frame = window.frame
            blackView.alpha = 0
            UIView.animate(withDuration: 0.5, animations: {self.blackView.alpha = 1})
            
        }
        
    }
    @objc func handleDismissBlackViewKeyboard(){
        
        blackView.endEditing(true)
        
        
        
    }
    
    @objc func handleDismissGuidance(){
        UIView.animate(withDuration: 0.2, animations: {self.blackView.alpha = 0})
        let indexPath = IndexPath(item: 0, section: 0)
        swipingPhysicalInputView.pageControl.currentPage = 0
        swipingPhysicalInputView.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        
        NotificationCenter.default.removeObserver(self)
    }
    
}


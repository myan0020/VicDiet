//
//  LogInTextField.swift
//  VicDiet
//
//  Created by Ming Yang on 31/3/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit
@IBDesignable
class LogInTextField: UITextField{

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.borderColor = UIColor(white: 200/255, alpha: 1).cgColor
        self.layer.borderWidth = 2
        
        
    }
    
    
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 8, dy: 7)
    }
    
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }

    
    
    
    
    
    
}

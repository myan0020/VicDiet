//
//  UserProfileViewController.swift
//  VicDiet
//
//  Created by Ming Yang on 30/3/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit
import Firebase

class UserProfileViewController: UIViewController {

    
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
        } catch{
            
        }

        
        let logInPage = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = logInPage
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

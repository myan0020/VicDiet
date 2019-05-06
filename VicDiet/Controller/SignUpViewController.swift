//
//  SignUpViewController.swift
//  VicDiet
//
//  Created by Ming Yang on 30/3/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    
    
    @IBOutlet weak var backToLogInButton: UIBarButtonItem!
    
    
    @IBAction func backToLogInButtonTapped(_ sender: Any) {
        
        let logInViewController = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
        self.present(logInViewController,animated: true)
        
    }
    
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        
        
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

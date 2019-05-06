//
//  LogInViewController.swift
//  VicDiet
//
//  Created by Ming Yang on 30/3/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func logInButtonTapped(_ sender: Any) {
        
        guard let email = emailTextField.text else {
            displayErrorMessage("Please enter an email address")
            return
        }
        guard let password = passwordTextField.text else {
            displayErrorMessage("Please enter a password")
            return
        }
        
        Auth.auth().signIn(withEmail: "843670891@qq.com", password: "MingDongShenSen~07112134") {(user, error) in
            //print ("The sign in user id:")
            //print (user?.user.uid)
            if error != nil {
                
                self.displayErrorMessage(error!.localizedDescription)
                
            } else {
                if email == "843670891@qq.com" && password == "M"{
                    let homePageController = HomePageController(collectionViewLayout: UICollectionViewFlowLayout())
                    let appDelegate = UIApplication.shared.delegate
                    appDelegate?.window??.rootViewController = UINavigationController(rootViewController: homePageController)
                    let navigationBarAppearace = UINavigationBar.appearance()
                    navigationBarAppearace.barTintColor = UIColor(red: 125/255, green: 206/255, blue: 148/255, alpha: 1)
                }
//                let homePageController = HomePageController(collectionViewLayout: UICollectionViewFlowLayout())
//                let appDelegate = UIApplication.shared.delegate
//                appDelegate?.window??.rootViewController = UINavigationController(rootViewController: homePageController)
//                let navigationBarAppearace = UINavigationBar.appearance()
//                navigationBarAppearace.barTintColor = UIColor(red: 125/255, green: 206/255, blue: 148/255, alpha: 1)

                
            }
        }
    }
    
    
    
    @IBAction func beginSignUpButtonTapped(_ sender: Any) {
        
        let signUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.present(signUpViewController,animated: true)
        
    }
    
    
    
    func displayErrorMessage(_ errorMessage: String){
        let alertController = UIAlertController(title: "Error", message: errorMessage, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController,animated: true, completion: nil)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //assignbackground()
        // Do any additional setup after loading the view.
    }
    
    
    func assignbackground(){
        let backgroundImage = UIImage(named: "login_image")
        let onBackground = UIImage(named: "blank_image")
        
        
        
        var backgroundImageView : UIImageView!
        var onBackgroundImageView : UIImageView!
        
        backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.contentMode =  UIView.ContentMode.scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.image = backgroundImage
        backgroundImageView.center = view.center
        view.addSubview(backgroundImageView)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.sendSubviewToBack(backgroundImageView)
        
        //backgroundImageView.addSubview(onBackgroundImageView)
        
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

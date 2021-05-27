//
//  LoginViewController.swift
//  Project_CoreData
//
//  Created by RP-34 on 30/04/21.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    @IBOutlet weak var msgSignInLoginLabel: UILabel!
    @IBOutlet weak var userLoginTxt: UITextField!
    @IBOutlet weak var passwordLogintxt: UITextField!
    
    @IBOutlet weak var signInLoginBtn: UIButton!
    
    @IBOutlet weak var signUpLoginBtn: UIButton!
    
    var userArray = [Profile]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // print(dataArray)
       
    }
    

    @IBAction func signInLoginActn(_ sender: Any) {
        
        var flag : Int = 0
        
//        let user = DatabaseHelper.instance.fetchProfile(name: userLoginTxt.text!, password: passwordLogintxt.text!)
//        if user?.name == userLoginTxt.text && user?.password == //passwordLogintxt.text {
        userArray = DatabaseHelper.instance.fetchProfile()
        for i in 0..<self.userArray.count
        {
            if (self.userArray[i].name == userLoginTxt.text) && (self.userArray[i].password == passwordLogintxt.text) {
                let defaultProfile = UserDefaults.standard
                defaultProfile.set(self.userArray[i].name, forKey: "userName")
                defaultProfile.set(self.userArray[i].email, forKey: "userEmail")
                defaultProfile.set(self.userArray[i].password, forKey: "userPassword")
                defaultProfile.set(self.userArray[i].contact, forKey: "userContact")
                print("Valid User")
                flag = 1
                if flag == 1 {
                    msgSignInLoginLabel.text = ""
                    
    //                let username = UserDefaults.standard.object(forKey: "userName")
    //                print(username!)
                    let story = UIStoryboard(name: "Main", bundle: nil)
                    let controller = story.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                    present(controller, animated: true, completion: nil)
                }
                else {
                    msgSignInLoginLabel.text = "Incorrect User"
                }
              
                
               return
            }
        else {
            msgSignInLoginLabel.text = "Incorrect User"
            print("Incorrect User")
        }
    }
    }
    
    @IBAction func signUpLoginActn(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let controller = story.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        present(controller, animated: true, completion: nil)
        
    }
    
}

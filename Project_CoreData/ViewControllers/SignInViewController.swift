//
//  ViewController.swift
//  Project_CoreData
//
//  Created by RP-34 on 19/04/21.
//

import UIKit


class SignInViewController: UIViewController {

    @IBOutlet weak var backSignInBtn: UIButton!
    @IBOutlet weak var nameSignInTxt: UITextField!
    
    @IBOutlet weak var emailSignIntxt: UITextField!
    
    @IBOutlet weak var contactSignInTxt: UITextField!
    
    @IBOutlet weak var passwordSignInTxt: UITextField!
    
    @IBOutlet weak var conPaswordSignInTxt: UITextField!
    
    @IBOutlet weak var submitSignInBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nameSignInTxt.becomeFirstResponder()
    }

    @IBAction func submitSignInBtnActn(_ sender: UIButton) {
       
        var dict:[String:Any] = ["name" : nameSignInTxt.text , "email" : emailSignIntxt.text , "contact" : contactSignInTxt.text , "password" : passwordSignInTxt.text]
        DatabaseHelper.instance.saveSignIn(myDict: dict)
    }
    
    @IBAction func backSignTnBtnActn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signInTapGesture(_ sender: Any) {
        self.view.endEditing(true)
    }
    
}
extension SignInViewController : UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == nameSignInTxt {
            var frame = view.frame
            frame.origin.y = -20
            view.frame = frame
        }
        else if textField == emailSignIntxt {
            var frame = view.frame
            frame.origin.y = -20
            view.frame = frame
        }
        else if textField == contactSignInTxt {
            var frame = view.frame
            frame.origin.y = -20
            view.frame = frame
        }
        else if textField == passwordSignInTxt {
            var frame = view.frame
            frame.origin.y = -20
            view.frame = frame
        }
        else if textField == conPaswordSignInTxt {
            var frame = view.frame
            frame.origin.y = -20
            view.frame = frame
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == conPaswordSignInTxt {
            var frame = view.frame
            frame.origin.y = 0
            view.frame = frame
        }
        return true
    }
    
    
}


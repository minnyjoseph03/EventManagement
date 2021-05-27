//
//  ProfileEditViewController.swift
//  Project_CoreData
//
//  Created by RP-34 on 30/04/21.
//

import UIKit

class ProfileEditViewController: UIViewController {

    @IBOutlet weak var backProfileBtn: UIButton!
    @IBOutlet weak var contactseditPtxt: UITextField!
    @IBOutlet weak var emaileditPtxt: UITextField!
    @IBOutlet weak var nameeditPtxt: UITextField!
    
    @IBOutlet weak var editProfileBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let username = UserDefaults.standard.object(forKey: "userName")
        let email = UserDefaults.standard.object(forKey: "userEmail")
        let contact = UserDefaults.standard.object(forKey: "userContact")
        nameeditPtxt.text = username as? String
        emaileditPtxt.text = email as? String
        contactseditPtxt.text = contact as? String
    }
    
    @IBAction func editProfileBtnActn(_ sender: UIButton) {
        var updateProfile : [String : Any] = ["name" : nameeditPtxt.text , "email" : emaileditPtxt.text , "contact" : contactseditPtxt.text]
        DatabaseHelper.instance.updateProfile(updateDict: updateProfile)
    }
    
   
    @IBAction func backProfileBtnActn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

//
//  AddEventViewController.swift
//  Project_CoreData
//
//  Created by RP-34 on 30/04/21.
//

import UIKit

class AddEventViewController: UIViewController {

    @IBOutlet weak var backAddEventActnBtn: UIButton!
    @IBOutlet weak var emailAddEventActxt: UITextField!
    
    @IBOutlet weak var passwordAddEventActtxt: UITextField!
    
    @IBOutlet weak var contactAddEventActtxt: UITextField!
    
    @IBOutlet weak var addBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addBtnActn(_ sender: UIButton) {
        var adminDict:[String : Any] = ["email" : emailAddEventActxt.text , "password" : passwordAddEventActtxt.text , "contact" : contactAddEventActtxt.text]
        DatabaseHelper.instance.saveAdmin(myAdminDict: adminDict)
    }
    
    @IBAction func backAddEventBtnActn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}

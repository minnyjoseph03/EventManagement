//
//  EventLoginViewController.swift
//  Project_CoreData
//
//  Created by RP-34 on 30/04/21.
//

import UIKit

class EventLoginViewController: UIViewController {

    @IBOutlet weak var passwordEventLogintxt: UITextField!
    @IBOutlet weak var nameEventLogintxt: UITextField!
    @IBOutlet weak var eventLoginSubmitBtn: UIButton!
    @IBOutlet weak var eventRegBtn: UIButton!
    
    @IBOutlet weak var eventLoginBackBtn: UIButton!
    @IBOutlet weak var errorMsgEventtxt: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func eventLoginSubmitBtnActn(_ sender: Any) {
        let adminDetail = DatabaseHelper.instance.fetchAdmin(email: nameEventLogintxt.text!, password: passwordEventLogintxt.text!)
        if adminDetail?.email == nameEventLogintxt.text && adminDetail?.password == passwordEventLogintxt.text {
            let storyAdmin = UIStoryboard(name: "Main", bundle: nil)
            let controllerAdmin = storyAdmin.instantiateViewController(withIdentifier: "EventRegViewController") as! EventRegViewController
            present(controllerAdmin, animated: true, completion: nil)
        }
        else{
            errorMsgEventtxt.text = "Incorrect User"
            print("Incorrect User")
        }
    }
    @IBAction func eventRegbackBtnActn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func eventRegBtnActn(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let controller = story.instantiateViewController(withIdentifier: "AddEventViewController") as! AddEventViewController
        present(controller, animated: true, completion: nil)
    }
    

}

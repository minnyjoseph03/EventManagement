//
//  TickeyRegViewController.swift
//  Project_CoreData
//
//  Created by Nixon on 10/05/21.
//

import UIKit
import iOSDropDown

class TickeyRegViewController: UIViewController {
    var eventList = [Events]()
    var eventDetail = [eventclass]()
    var countVal : Double!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var saveTicBtn: UIButton!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var totalAmountTxt: UITextField!
    @IBOutlet weak var noofTicStepper: UIStepper!
    @IBOutlet weak var ticAmountTxt: UITextField!
    @IBOutlet weak var ticAvailabilityTxt: UITextField!
    @IBOutlet weak var selectEventDropD: DropDown!
    @IBOutlet weak var userNametxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let username = UserDefaults.standard.object(forKey: "userName")
        let email = UserDefaults.standard.object(forKey: "userEmail")
        userNametxt.text = username as? String
        emailTxt.text = email as? String
        eventList = DatabaseHelper.instance.fetchEvent()
        var eventName = [String]()
        for i in eventList {
            let event = i.eventName
            eventName.append(event!)
        }
        selectEventDropD.optionArray = eventName
        selectEventDropD.didSelect { (selectedEvent, index, id) in
            self.selectEventDropD.text = "\(selectedEvent)"
            self.eventDetail = DatabaseHelper.instance.fetchSelectedEvent(eventName: "\(selectedEvent)")
            self.ticAvailabilityTxt.text = self.eventDetail[0].event_totalTickt
            self.ticAmountTxt.text = self.eventDetail[0].event_amount
            self.noofTicStepper.minimumValue = 0
            self.noofTicStepper.maximumValue = Double(self.ticAvailabilityTxt.text!)!
            print(self.ticAvailabilityTxt.text!)
            
            
            
        }
        
    }
    
    @IBAction func stepperActn(_ sender: UIStepper) {
        countLabel.text = String(sender.value)
        countVal = Double(sender.value)
        let amnt = Double(ticAmountTxt.text!)
        print(countVal!)
        print(amnt!)
        let totalAmnt = countVal * amnt!
        self.totalAmountTxt.text = String(totalAmnt)
        //let ticAva = Double(self.ticAvailabilityTxt.text!)! - countVal
        //ticAvailabilityTxt.text = String(ticAva)
        
    }
    
   
    @IBAction func saveTicBtnActn(_ sender: UIButton) {
        
        let totalTicket = Double(ticAvailabilityTxt.text!)
        let ticketCount = countVal
        let balanceTicket = totalTicket! - ticketCount!
        let ticketDict = ["userName" : userNametxt.text , "eventName" : selectEventDropD.text , "ticketCount" : countLabel.text , "ticTotalAmnt" : totalAmountTxt.text , "email" : emailTxt.text]
        DatabaseHelper.instance.saveTicket(ticketDict: ticketDict as [String : Any], eventName: selectEventDropD.text! , ticketCount: String(balanceTicket), email: emailTxt.text!)
    }
    
}

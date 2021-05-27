//
//  EventRegViewController.swift
//  Project_CoreData
//
//  Created by RP-34 on 30/04/21.
//

import UIKit

class EventRegViewController: UIViewController {
    
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var EventDateBtn: UIButton!
    @IBOutlet weak var eventBackBtn: UIButton!
    @IBOutlet weak var eventRegImageBtn: UIButton!
    @IBOutlet weak var eventDatetxt: UITextField!
    @IBOutlet weak var eventTicketAmounttxt: UITextField!
    @IBOutlet weak var eventTicketCount: UITextField!
    @IBOutlet weak var eventVenuetxt: UITextField!
    @IBOutlet weak var eventDesptntxt: UITextField!
    @IBOutlet weak var eventNametxt: UITextField!
    @IBOutlet weak var eventImageUpload: UIImageView!
    @IBOutlet weak var addEventBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker.delegate = self
    }
    
    var image:Data!
  
    @IBAction func eventImageBtnActn(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
        eventRegImageBtn.isEnabled = false
        eventRegImageBtn.isHidden = true
    }
    
    @IBAction func addEventBtnActn(_ sender: UIButton) {
        var eventDict : [String:Any] = ["eventName" : eventNametxt.text , "eventDescptn" : eventDesptntxt.text , "eventAddress" : eventVenuetxt.text , "eventTicketAmnt" : eventTicketAmounttxt.text , "eventTicketCount" : eventTicketCount.text , "eventDate" : eventDatetxt.text , "eventImage" : image]
        DatabaseHelper.instance.saveEvent(eventDict: eventDict)
    }
    
    @IBAction func eventBackBtnActn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func eventDateBtnActn(_ sender: UIButton) {
        let storyDate = UIStoryboard(name: "Main", bundle: nil)
        let controllerDate = storyDate.instantiateViewController(withIdentifier: "EventCalenderVC") as! EventCalenderVC
        controllerDate.delegateDate = self
        present(controllerDate, animated: true, completion: nil)
    }
}
extension EventRegViewController : passDateValue ,UIImagePickerControllerDelegate ,UINavigationControllerDelegate {
    func datePickvalue(selectDate: String) {
        eventDatetxt.text = selectDate
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            eventImageUpload.contentMode = .scaleAspectFit
            eventImageUpload.image = pickedImage
            image = pickedImage.pngData()
            dismiss(animated: true, completion: nil)
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

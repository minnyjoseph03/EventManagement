//
//  EventListViewController.swift
//  Project_CoreData
//
//  Created by RP-34 on 30/04/21.
//

import UIKit

class EventListViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var backEventBtn: UIButton!
    var eventDetail = [Events]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        eventDetail = DatabaseHelper.instance.fetchEvent()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! eventCell
        cell.eventImage.image = UIImage(data: eventDetail[indexPath.row].eventImage!)
        cell.eventName.text = eventDetail[indexPath.row].eventName
        cell.eventLocation.text = eventDetail[indexPath.row].eventAddress
        cell.eventAmount.text = "Amount : \(eventDetail[indexPath.row].eventTicketAmnt!)"
        cell.eventDecptn.text = eventDetail[indexPath.row].eventDescptn
        cell.eventDate.text = "Date : \(eventDetail[indexPath.row].eventDate!)"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 232
    }

    @IBAction func backEventBtnActn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

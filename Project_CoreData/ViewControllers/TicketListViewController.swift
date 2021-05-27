//
//  TicketListViewController.swift
//  Project_CoreData
//
//  Created by RP-34 on 30/04/21.
//

import UIKit

class TicketListViewController: UIViewController {
    @IBOutlet weak var backBtn: UIButton!
    var ticDetail = [ticketmodel]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let userName = UserDefaults.standard.object(forKey: "userName")
        
        //ticDetail = DatabaseHelper.instance.fetchTicketDetail(userName: userName as! String)
        
        ticDetail = DatabaseHelper.instance.myticktfetch(name: userName as! String)
    }
    
    @IBAction func backBtnActn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
   
}
extension TicketListViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(ticDetail)
         return ticDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellTic = tableView.dequeueReusableCell(withIdentifier: "ticketCell", for: indexPath) as! ticketCell
        cellTic.eventNameLabel.text = ticDetail[indexPath.row].eventname
        cellTic.userNameLabel.text = ticDetail[indexPath.row].user
       // cellTic.eventNameLabel.text = ticDetail[indexPath.row].ticketEventName
        cellTic.ticketCountLabel.text = ticDetail[indexPath.row].tickets
        cellTic.totalTicAmountLabel.text = ticDetail[indexPath.row].amount
        print(cellTic.eventNameLabel.text!)
        print(cellTic.userNameLabel.text!)
        return cellTic
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 151
    }
    
    
}

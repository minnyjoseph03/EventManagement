//
//  EventCalenderVC.swift
//  Project_CoreData
//
//  Created by RP-34 on 03/05/21.
//

import UIKit
import FSCalendar


class EventCalenderVC: UIViewController, FSCalendarDataSource ,FSCalendarDelegate {

    var delegateDate : passDateValue!
    @IBOutlet weak var calenderEvent: FSCalendar!
    //    fileprivate weak var calendar: FSCalendar!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var backCalenderBtn: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
//        calendar.dataSource = self
//        calendar.delegate = self
//        view.addSubview(calendar)
//        self.calendar = calendar
//
      
        
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        //dateFormatter.dateStyle = DateFormatter.Style.long
        let eventDate = dateFormatter.string(from: date )
        dateLabel.text = eventDate
        delegateDate.datePickvalue(selectDate: eventDate)
        dismiss(animated: true, completion: nil)
    }
   

    @IBAction func backcalenderBtnActn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
protocol passDateValue {
    func datePickvalue(selectDate:String)
}

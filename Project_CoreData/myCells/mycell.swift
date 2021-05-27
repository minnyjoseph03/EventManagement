//
//  mycell.swift
//  Project_CoreData
//
//  Created by Nixon on 02/05/21.
//

import Foundation
import UIKit

class homeCell : UICollectionViewCell {
    
    @IBOutlet weak var eventImage: UIImageView!
    
}

class eventCell : UITableViewCell {
    
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventDecptn: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventAmount: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
}

class ticketCell : UITableViewCell {
    
    @IBOutlet weak var eventNameLabel: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var ticketCountLabel: UILabel!
    @IBOutlet weak var totalTicAmountLabel: UILabel!
}

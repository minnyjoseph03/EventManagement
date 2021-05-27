//
//  TicketCounter+CoreDataProperties.swift
//  Project_CoreData
//
//  Created by Nixon on 04/05/21.
//
//

import Foundation
import CoreData


extension TicketCounter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TicketCounter> {
        return NSFetchRequest<TicketCounter>(entityName: "TicketCounter")
    }

    @NSManaged public var ticketAmount: String?
    @NSManaged public var ticketDate: String?
    @NSManaged public var ticketEmail: String?
    @NSManaged public var ticketEventName: String?
    @NSManaged public var ticketNo: String?
    @NSManaged public var ticketUser: String?
    @NSManaged public var eventrelation: Events?
    @NSManaged public var userrelation: Profile?

}

extension TicketCounter : Identifiable {

}

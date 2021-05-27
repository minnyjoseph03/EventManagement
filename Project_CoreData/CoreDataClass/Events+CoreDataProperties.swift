//
//  Events+CoreDataProperties.swift
//  Project_CoreData
//
//  Created by Nixon on 04/05/21.
//
//

import Foundation
import CoreData


extension Events {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Events> {
        return NSFetchRequest<Events>(entityName: "Events")
    }

    @NSManaged public var eventAddress: String?
    @NSManaged public var eventDate: String?
    @NSManaged public var eventDescptn: String?
    @NSManaged public var eventImage: Data?
    @NSManaged public var eventName: String?
    @NSManaged public var eventTicketAmnt: String?
    @NSManaged public var eventTicketCount: String?
    @NSManaged public var adminrelation: Admin?
    @NSManaged public var eventtickets: NSSet?

}

// MARK: Generated accessors for eventtickets
extension Events {

    @objc(addEventticketsObject:)
    @NSManaged public func addToEventtickets(_ value: TicketCounter)

    @objc(removeEventticketsObject:)
    @NSManaged public func removeFromEventtickets(_ value: TicketCounter)

    @objc(addEventtickets:)
    @NSManaged public func addToEventtickets(_ values: NSSet)

    @objc(removeEventtickets:)
    @NSManaged public func removeFromEventtickets(_ values: NSSet)

}

extension Events : Identifiable {

}

//
//  Profile+CoreDataProperties.swift
//  Project_CoreData
//
//  Created by Nixon on 04/05/21.
//
//

import Foundation
import CoreData


extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var contact: String?
    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var ticketrelation: NSSet?

}

// MARK: Generated accessors for ticketrelation
extension Profile {

    @objc(addTicketrelationObject:)
    @NSManaged public func addToTicketrelation(_ value: TicketCounter)

    @objc(removeTicketrelationObject:)
    @NSManaged public func removeFromTicketrelation(_ value: TicketCounter)

    @objc(addTicketrelation:)
    @NSManaged public func addToTicketrelation(_ values: NSSet)

    @objc(removeTicketrelation:)
    @NSManaged public func removeFromTicketrelation(_ values: NSSet)

}

extension Profile : Identifiable {

}

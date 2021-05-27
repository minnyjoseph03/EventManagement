//
//  Admin+CoreDataProperties.swift
//  Project_CoreData
//
//  Created by Nixon on 04/05/21.
//
//

import Foundation
import CoreData


extension Admin {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Admin> {
        return NSFetchRequest<Admin>(entityName: "Admin")
    }

    @NSManaged public var contacts: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var eventadd: NSSet?

}

// MARK: Generated accessors for eventadd
extension Admin {

    @objc(addEventaddObject:)
    @NSManaged public func addToEventadd(_ value: Events)

    @objc(removeEventaddObject:)
    @NSManaged public func removeFromEventadd(_ value: Events)

    @objc(addEventadd:)
    @NSManaged public func addToEventadd(_ values: NSSet)

    @objc(removeEventadd:)
    @NSManaged public func removeFromEventadd(_ values: NSSet)

}

extension Admin : Identifiable {

}

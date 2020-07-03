//
//  Paper+CoreDataProperties.swift
//  
//
//  Created by Tristan Brynildsen on 22/05/20.
//
//

import Foundation
import CoreData


extension Paper {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Paper> {
        return NSFetchRequest<Paper>(entityName: "Paper")
    }

    @NSManaged public var department: String?
    @NSManaged public var name: String?
    @NSManaged public var notes: String?
    @NSManaged public var paperCode: Int16
    @NSManaged public var semester: String?
    @NSManaged public var subjectCode: String?
    @NSManaged public var year: Int16
    @NSManaged public var occurances: NSSet?

}

// MARK: Generated accessors for occurances
extension Paper {

    @objc(addOccurancesObject:)
    @NSManaged public func addToOccurances(_ value: Occurance)

    @objc(removeOccurancesObject:)
    @NSManaged public func removeFromOccurances(_ value: Occurance)

    @objc(addOccurances:)
    @NSManaged public func addToOccurances(_ values: NSSet)

    @objc(removeOccurances:)
    @NSManaged public func removeFromOccurances(_ values: NSSet)

}

extension Paper {
    
    
    
    
}

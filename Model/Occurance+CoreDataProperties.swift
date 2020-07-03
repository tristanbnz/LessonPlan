//
//  Occurance+CoreDataProperties.swift
//  
//
//  Created by Tristan Brynildsen on 22/05/20.
//
//

import Foundation
import CoreData


extension Occurance {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Occurance> {
        return NSFetchRequest<Occurance>(entityName: "Occurance")
    }

    @NSManaged public var block: String?
    @NSManaged public var classNum: Int16
    @NSManaged public var day: Int16
    @NSManaged public var floor: String?
    @NSManaged public var length: Int16
    @NSManaged public var time: Int16
    @NSManaged public var paper: Paper?

}

extension Occurance {
    
    static func getPapersOnDay(day: Int) -> NSFetchRequest<Occurance> {
    
    let request = NSFetchRequest<Occurance>(entityName: "Occurance")
    request.predicate = NSPredicate(format: "day == %i", day)
        
    
    return request
    
    }
    
}

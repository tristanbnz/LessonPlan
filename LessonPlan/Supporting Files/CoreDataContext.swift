//
//  CoreDataContext.swift
//  CVTest1
//
//  Created by Tristan Brynildsen on 14/05/20.
//  Copyright © 2020 Tristan Brynildsen. All rights reserved.
//

import Foundation
import CoreData
import UIKit

enum coreDataContext {
    
    static func returnContext() -> NSManagedObjectContext?  {
        //get the appD
        guard let appD = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        
        //get the context
        let context = appD.persistentContainer.viewContext
        
        return context
    }
    
    static func saveContext() {
        guard let appD = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        appD.saveContext()
    }
    
    static func getPapers() -> [Paper]? {
        
        
        
        guard let appD = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        
        let context = appD.persistentContainer.viewContext
        
        let request: NSFetchRequest<Paper> = Paper.fetchRequest()
        
        do {
            
            let papers = try context.fetch(request)
            
            return papers
            
            
        } catch {
            print("Error with fetch request")
        }
        
        return nil
    }
    
    
}

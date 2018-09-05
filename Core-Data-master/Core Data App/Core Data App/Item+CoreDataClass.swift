//
//  Item+CoreDataClass.swift
//  Core Data App
//
//  Created by Brian Robinson on 5/8/18.
//  Copyright © 2018 Brian Robinson. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Item)
public class Item: NSManagedObject {
    var date: Date? {
        get {
            return dateAdded as Date?
        }
        set {
            dateAdded = newValue as NSDate?
        }
        
    }
    
    convenience init?(name: String?, price: Double, date: Date?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext
            else {
                return nil
            }
        
        self.init(entity: Item.entity(), insertInto: context)
        
        self.name = name
        self.price = price
        self.date = date
    }
}

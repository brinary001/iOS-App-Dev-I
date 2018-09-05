//
//  Location+CoreDataClass.swift
//  Core Data App
//
//  Created by Brian Robinson on 5/8/18.
//  Copyright © 2018 Brian Robinson. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Location)
public class Location: NSManagedObject {
    var items: [Item]? {
        return self.rawItems?.array as? [Item]
    }
    
    convenience init?(title: String) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext
            else {
            return nil
        }
        
        self.init(entity: Location.entity(), insertInto: context)
        
        self.title = title
    }
}

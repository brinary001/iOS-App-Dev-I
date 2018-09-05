//
//  Location+CoreDataProperties.swift
//  Core Data App
//
//  Created by Brian Robinson on 5/8/18.
//  Copyright © 2018 Brian Robinson. All rights reserved.
//
//

import Foundation
import CoreData


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var title: String?
    @NSManaged public var rawItems: NSOrderedSet?

}

// MARK: Generated accessors for rawItems
extension Location {

    @objc(insertObject:inRawItemsAtIndex:)
    @NSManaged public func insertIntoRawItems(_ value: Item, at idx: Int)

    @objc(removeObjectFromRawItemsAtIndex:)
    @NSManaged public func removeFromRawItems(at idx: Int)

    @objc(insertRawItems:atIndexes:)
    @NSManaged public func insertIntoRawItems(_ values: [Item], at indexes: NSIndexSet)

    @objc(removeRawItemsAtIndexes:)
    @NSManaged public func removeFromRawItems(at indexes: NSIndexSet)

    @objc(replaceObjectInRawItemsAtIndex:withObject:)
    @NSManaged public func replaceRawItems(at idx: Int, with value: Item)

    @objc(replaceRawItemsAtIndexes:withRawItems:)
    @NSManaged public func replaceRawItems(at indexes: NSIndexSet, with values: [Item])

    @objc(addRawItemsObject:)
    @NSManaged public func addToRawItems(_ value: Item)

    @objc(removeRawItemsObject:)
    @NSManaged public func removeFromRawItems(_ value: Item)

    @objc(addRawItems:)
    @NSManaged public func addToRawItems(_ values: NSOrderedSet)

    @objc(removeRawItems:)
    @NSManaged public func removeFromRawItems(_ values: NSOrderedSet)

}

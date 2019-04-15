//
//  Todo+CoreDataProperties.swift
//  DailyChores
//
//  Created by Christian Schmutte on 15.04.19.
//  Copyright © 2019 Christian Schmutte. All rights reserved.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var title: String
    @NSManaged public var done: Bool
    @NSManaged public var repeats: Bool
    @NSManaged public var parentCategory: Category?

}

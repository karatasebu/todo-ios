//
//  Todo.swift
//  to-do
//
//  Created by Ebubekir Karatas on 14.09.2022.
//

import CoreData

class Todo: NSManagedObject {
    @NSManaged var id: String
    @NSManaged var text: String
    @NSManaged var isActive: Bool
    @NSManaged var order: Int
}

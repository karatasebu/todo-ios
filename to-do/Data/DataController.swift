//
//  DataController.swift
//  to-do
//
//  Created by Ebubekir Karatas on 13.09.2022.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Data")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}

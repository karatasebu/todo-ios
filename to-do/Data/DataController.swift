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
    @Published var todos: [Todo] = []
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        fetch()
    }
    
    func fetch() {
        let request = NSFetchRequest<Todo>(entityName: "Todo")
        request.sortDescriptors = [NSSortDescriptor(key: "order", ascending: false)]
        do {
            todos = try container.viewContext.fetch(request)
        } catch let error {
            print("Error while fetching. \(error)")
        }
    }
    
    func save() {
        try? container.viewContext.save()
        fetch()
    }
    
    func findIndex(id: String) -> Int {
        return todos.firstIndex(where: {$0.id == id})!
    }
    
    func toggleStatus(todo: Todo) {
        todos[findIndex(id: todo.id!)].isActive.toggle()
        save()
    }
    
    func createItem(value: String) {
        let todo = Todo(context: container.viewContext)
        todo.id = UUID().uuidString
        todo.text = value
        todo.isActive = true
        todo.order = Int64(todos.count)
        save()
    }
    
    func deleteItem(todo: Todo) {
        container.viewContext.delete(todos[findIndex(id: todo.id!)])
        save()
    }
}

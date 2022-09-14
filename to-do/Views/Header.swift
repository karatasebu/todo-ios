//
//  Header.swift
//  to-do
//
//  Created by Ebubekir Karatas on 14.09.2022.
//

import SwiftUI

struct Header: View {
    
    @State var value = ""
    @FetchRequest(sortDescriptors: []) var todos: FetchedResults<Todo>
    @Environment(\.managedObjectContext) var moc
    
    func submit() {
        if value != "" {
            let todo = Todo(context: moc)
            todo.id = UUID().uuidString
            todo.text = value
            todo.isActive = true
            todo.order = Int64(todos.count)
            try? moc.save()
            value = ""
        }
    }
    
    var body: some View {
        Text("todos")
            .foregroundStyle(.purple)
            .font(.system(size: 50, weight: .bold))
        
        TextField("Enter your todo", text: $value)
            .padding()
            .background(Color.white.shadow(radius: 5))
            .padding([.trailing, .leading], 20)
            .onSubmit {
                submit()
            }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}

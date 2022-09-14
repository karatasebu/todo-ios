//
//  TodoList.swift
//  to-do
//
//  Created by Ebubekir Karatas on 13.09.2022.
//

import SwiftUI

struct TodoList: View {
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "order", ascending: false)]) var todos: FetchedResults<Todo>
    @Environment(\.managedObjectContext) var moc
    
    func findIndex(id: String) -> Int {
        return todos.firstIndex(where: {$0.id == id})!
    }
    
    func toggleStatus(todo: Todo) {
        todos[findIndex(id: todo.id!)].isActive.toggle()
        try? moc.save()
    }
    
    func deleteItem(todo: Todo) {
        moc.delete(todos[findIndex(id: todo.id!)])
        try? moc.save()
    }
    
    var body: some View {
        List {
            ForEach(todos) { todo in
                Text(todo.text!)
                    .strikethrough(!todo.isActive)
                    .font(.system(size: 20))
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                    .listRowBackground(Color.gray)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparatorTint(.white)
                    .swipeActions(allowsFullSwipe: false) {
                        Button {
                            toggleStatus(todo: todo)
                        } label: {
                            todo.isActive ?
                                Label("Done", systemImage: "checkmark.circle") :
                                Label("Done", systemImage: "arrowshape.turn.up.backward.fill")
                        }
                        .tint(.green)

                        Button(role: .destructive) {
                            deleteItem(todo: todo)
                        } label: {
                            Label("Delete", systemImage: "trash.fill")
                        }
                    }
            }
        }
        .listStyle(InsetListStyle())
        .onAppear {
            UITableView.appearance().backgroundColor = .clear
        }
        .padding(.top, 20)
        .safeAreaInset(edge: .bottom, alignment: .center, spacing: 0) {
            Color.clear
                .frame(height: 7)
                .background(.white)
                .opacity(0.7)
        }
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        TodoList()
    }
}

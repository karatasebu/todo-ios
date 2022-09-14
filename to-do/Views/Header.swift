//
//  Header.swift
//  to-do
//
//  Created by Ebubekir Karatas on 14.09.2022.
//

import SwiftUI

struct Header: View {
    
    @State var value = ""
    @StateObject var dataController: DataController
    
    var body: some View {
        Text("todos")
            .foregroundStyle(.purple)
            .font(.system(size: 50, weight: .bold))
        
        TextField("Enter your todo", text: $value)
            .padding()
            .background(Color.white.shadow(radius: 5))
            .padding([.trailing, .leading], 20)
            .onSubmit {
                guard !value.isEmpty else { return }
                dataController.createItem(value: value)
                value = ""
            }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(dataController: DataController())
    }
}

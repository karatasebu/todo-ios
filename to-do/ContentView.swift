//
//  ContentView.swift
//  to-do
//
//  Created by Ebubekir Karatas on 12.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var dataController = DataController()
    
    var body: some View {
        Header(dataController: dataController)
        TodoList(dataController: dataController)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

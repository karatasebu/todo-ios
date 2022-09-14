//
//  ContentView.swift
//  to-do
//
//  Created by Ebubekir Karatas on 12.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Header()
            TodoList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

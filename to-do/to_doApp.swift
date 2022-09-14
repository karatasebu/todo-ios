//
//  to_doApp.swift
//  to-do
//
//  Created by Ebubekir Karatas on 12.09.2022.
//

import SwiftUI

@main
struct to_doApp: App {
    
//    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}

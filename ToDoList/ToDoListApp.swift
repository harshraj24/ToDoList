//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Harsh Raj on 09/06/22.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    @StateObject var itemViewModel = ItemViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(itemViewModel)
        }
    }
}

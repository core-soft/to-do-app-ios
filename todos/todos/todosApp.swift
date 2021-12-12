//
//  todosApp.swift
//  todos
//
//  Created by Fatih Kilit on 9.12.2021.
//

import SwiftUI

@main
struct todosApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    @StateObject var itemViewModel: ItemViewModel = ItemViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
            .environmentObject(itemViewModel)
            .accentColor(Color("ReddishColor"))
        }
    }
}

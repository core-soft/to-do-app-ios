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
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
            .accentColor(Color("ReddishColor"))
        }
    }
}

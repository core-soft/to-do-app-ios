//
//  ListViewModel.swift
//  todos
//
//  Created by Fatih Kilit on 12.12.2021.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var lists: [ListModel] = [] {
        didSet {
            // Do saving process.
            saveList()
        }
    }
    
    let listsKey: String = "lists"
    
    init() {
        getLists()
    }
    
    func getLists() {
        
        guard
            let data = UserDefaults.standard.data(forKey: listsKey),
            let savedLists = try? JSONDecoder().decode([ListModel].self, from: data)
        else {return}
        
        lists = savedLists
    }
    
    func addList(title: String) {
        let newList = ListModel(title: title)
        lists.append(newList)
    }
    
    func deleteList(indexSet: IndexSet) {
        lists.remove(atOffsets: indexSet)
    }
    
    func moveList(from: IndexSet, to: Int) {
        lists.move(fromOffsets: from, toOffset: to)
    }
    
    func saveList() {
        if let encodedData = try? JSONEncoder().encode(lists) {
            UserDefaults.standard.set(encodedData, forKey: listsKey)
        }
    }
}

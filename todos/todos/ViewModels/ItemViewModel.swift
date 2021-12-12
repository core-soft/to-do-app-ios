//
//  ItemViewModel.swift
//  todos
//
//  Created by Fatih Kilit on 12.12.2021.
//

import Foundation

class ItemViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedData = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        items = savedData
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func deleteItem(indexSet: IndexSet)
    {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int)
    {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func saveItems() {
        let encodedData = try? JSONEncoder().encode(items)
        UserDefaults.standard.set(encodedData, forKey: itemsKey)
    }
}

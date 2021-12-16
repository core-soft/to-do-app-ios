//
//  ListModel.swift
//  todos
//
//  Created by Fatih Kilit on 12.12.2021.
//

import Foundation

struct ListModel: Identifiable, Codable{
    
    let id: String
    let title: String
    
    init(id: String = UUID().uuidString, title: String) {
        self.id = id
        self.title = title
    }
}

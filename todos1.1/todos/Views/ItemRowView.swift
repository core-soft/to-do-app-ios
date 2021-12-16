//
//  ListRowView.swift
//  todos
//
//  Created by Fatih Kilit on 12.12.2021.
//

import SwiftUI

struct ItemRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            
            Text(item.title)
                .strikethrough(item.isCompleted, color: .primary)
                .foregroundColor(item.isCompleted ? .secondary : .primary)
            
            Spacer()
        }
        .font(.title2)
        .padding(8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(item: ItemModel(title: "Default Item", isCompleted: false))
    }
}

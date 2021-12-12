//
//  ItemView.swift
//  todos
//
//  Created by Fatih Kilit on 12.12.2021.
//

import SwiftUI

struct ItemView: View {
    
    @EnvironmentObject var itemViewModel: ItemViewModel
    
    let topicId: String
    
    var body: some View {
        ZStack {
            if(itemViewModel.items.isEmpty) {
                NoItemView()
                    .transition(.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(itemViewModel.items) { item in
                        Text(item.title)
                            .font(.title3)
                    }
                    .onDelete(perform: itemViewModel.deleteItem)
                    .onMove(perform: itemViewModel.moveItem)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                EditButton()
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView {
            ItemView(topicId: "")
                .preferredColorScheme(.dark)
            .environmentObject(ItemViewModel())
        }
    }
}

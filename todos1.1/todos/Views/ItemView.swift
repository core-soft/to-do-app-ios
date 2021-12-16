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
                        ItemRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    itemViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: itemViewModel.deleteItem)
                    .onMove(perform: itemViewModel.moveItem)
                }
            }
            
            VStack() {
                Spacer()
                HStack() {
                    Spacer()
    
                    NavigationLink {
                        AddItemView()
                    } label: {
                        PlusView()
                    }
                    .opacity(itemViewModel.items.isEmpty ? 0.0 : 1.0)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                EditButton()
                    .font(.title2)
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

//
//  MainView.swift
//  todos
//
//  Created by Fatih Kilit on 9.12.2021.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if(listViewModel.lists.isEmpty) {
                NoListsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else
            {
                List {
                    ForEach(listViewModel.lists) { list in
                        NavigationLink {
                            // Go items view.
                            ItemView(topicId: list.id)
                        } label: {
                            Text(list.title)
                                .font(.title3)
                        }
                    }
                    .onDelete(perform: listViewModel.deleteList)
                    .onMove(perform: listViewModel.moveList)
                }// END LIST
            }
            VStack() {
                Spacer()
                HStack() {
                    Spacer()
    
                    NavigationLink {
                        AddListView()
                    } label: {
                        PlusView()
                    }
                    .opacity(listViewModel.lists.isEmpty ? 0.0 : 1.0)
                }
            }
        }
        .navigationTitle("Lists")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
                    .font(.title2)
                    .foregroundColor(Color("ReddishColor"))
                    .opacity(listViewModel.lists.isEmpty ? 0.0 : 1.0)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
                .preferredColorScheme(.dark)
        }
        .preferredColorScheme(.dark)
        .environmentObject(ListViewModel())
        
    }
}

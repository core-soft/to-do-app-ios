//
//  AddItemView.swift
//  todos
//
//  Created by Fatih Kilit on 12.12.2021.
//

import SwiftUI

struct AddItemView: View {
    
    @State var textFieldText: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    
    @EnvironmentObject var itemViewModel: ItemViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.secondary.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                
                Button {
                    addListButtonPressed()
                } label: {
                    Text("add item".uppercased())
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .padding(10)
                        .padding(.horizontal)
                        .background(Color("ReddishColor"))
                        .cornerRadius(10)
                }
            }
            .padding()
        } // END SCROLLVİEW
        .navigationTitle("Add an List 🖋")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func addListButtonPressed() {
        if textIsAppropriate() {
            itemViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }

    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new list must be at least 3 characters long! ☹️😭"
            showAlert.toggle()
            
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
            .preferredColorScheme(.dark)
    }
}

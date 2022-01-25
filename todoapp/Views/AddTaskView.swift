//
//  AddTaskView.swift
//  todoapp
//
//  Created by Fatih Kilit on 25.01.2022.
//

import SwiftUI

struct AddTaskView: View {
    
    @State var titleTextField: String = ""
    @EnvironmentObject var vm: CoreDataViewModel
    @Binding var list: ListEntity
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            TextField("Type something...", text: $titleTextField, prompt: .none)
                .foregroundColor(Color.white)
                .padding()
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.secondary.opacity(0.3))
                .frame(maxWidth: .infinity)
                .cornerRadius(10)
            
            Button {
                saveButtonPressed()
            } label: {
                Text("SAVE")
                    .foregroundColor(.white)
                    .font(.headline)
                    .bold()
                    .frame(height: 55)
                    .padding(.horizontal)
                    .background(Color.pink)
                    .cornerRadius(10)
            }
            
        }
        .padding(.horizontal)
        .alert(alertTitle, isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        }
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            vm.addTask(titleForTask: titleTextField, list: list)
            titleTextField = ""
        }
    }
    
    func textIsAppropriate() -> Bool {
        if titleTextField.count < 1 {
            alertTitle = "New task must be at least one character long! 😭"
            showAlert.toggle()
            return false
        }
        return true
    }
}

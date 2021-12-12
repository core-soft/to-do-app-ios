//
//  NoListsView.swift
//  todos
//
//  Created by Fatih Kilit on 12.12.2021.
//

import SwiftUI

struct NoListsView: View {
    
    @State var animate: Bool = false
    
    let orangeishColor: Color = Color("OrangeishColor")
    let reddishColor: Color = Color("ReddishColor")
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20) {
                Text("There are no lists!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text("Click the add button and add an list to your list!")
                    .font(.title3)
                
                NavigationLink {
                    AddListView()
                } label: {
                    Text("Add Something 🤩")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? orangeishColor : reddishColor)
                        
                        .cornerRadius(10)
                }
                .padding(.horizontal, 50)
                .shadow(color: animate ? orangeishColor.opacity(0.3) : reddishColor.opacity(0.3),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 0.9)
                .offset(y: animate ? -7 : 0)
            }
            .padding(30)
            .onAppear(perform: addAnimation)
            .multilineTextAlignment(.center)
        }
    }
    
    func addAnimation() {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoListsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoListsView()
                .navigationTitle("Title")
                .preferredColorScheme(.dark)
        }
    }
}

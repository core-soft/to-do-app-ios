//
//  NoItemView.swift
//  todos
//
//  Created by Fatih Kilit on 12.12.2021.
//

import SwiftUI

struct NoItemView: View {
    @State var animate: Bool = false
    
    let orangeishColor: Color = Color("OrangeishColor")
    let reddishColor: Color = Color("ReddishColor")
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20) {
                Text("There are no items in the list!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text("Let's add some assignment!")
                    .font(.title3)
                
                NavigationLink {
                    AddItemView()
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

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NoItemView()
            .preferredColorScheme(.dark)
    }
}

//
//  PlusView.swift
//  todos
//
//  Created by Fatih Kilit on 12.12.2021.
//

import SwiftUI

struct PlusView: View {
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 55, height: 55)
                .foregroundColor(.secondary.opacity(0.3))
            
            Image(systemName: "plus.circle")
                .font(.system(size: 45).bold())
                .foregroundColor(Color("ReddishColor"))
        }
        .padding()
    }
}

struct PlusView_Previews: PreviewProvider {
    static var previews: some View {
        PlusView()
            .preferredColorScheme(.dark)
    }
}

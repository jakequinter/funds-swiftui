//
//  ContentView.swift
//  Funds
//
//  Created by Jake Quinter on 7/8/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Groceries")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.blue)
                
                Spacer()
                
                Text("100/500")
                    .font(.footnote.weight(.semibold))
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.secondary)
                
            }
            .padding(.all, 20)
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .background(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

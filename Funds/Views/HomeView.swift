//
//  HomeView.swift
//  Funds
//
//  Created by Jake Quinter on 7/11/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
            TabView {
                ForEach(categories) { category in
                    GeometryReader { proxy in
                        let minX = proxy.frame(in: .global).minX
                        
                        FeaturedCategory(category: category)
                            .padding(.vertical, 40)
                            .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
                            .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                            .blur(radius: abs(minX / 40))
                        
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .background(Image("Blob 1").offset(x: 250, y: -100))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

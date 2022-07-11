//
//  FeaturedCategory.swift
//  Funds
//
//  Created by Jake Quinter on 7/11/22.
//

import SwiftUI

struct FeaturedCategory: View {
    var category: Category = categories[0]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(category.name)
                .font(.largeTitle.bold())
                .foregroundStyle(.blue)
            
            Spacer()
            
            Text("hello")
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .padding(.horizontal, 20)
    }
}

struct FeaturedCategory_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedCategory()
    }
}

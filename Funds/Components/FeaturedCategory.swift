//
//  FeaturedCategory.swift
//  Funds
//
//  Created by Jake Quinter on 7/11/22.
//

import SwiftUI

struct FeaturedCategory: View {
    var category: Category
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
                Text(category.name)
                    .font(.largeTitle.bold())
                    .foregroundStyle(.blue)
                
                Spacer()
                
            HStack(alignment: .center) {
//                    Text("$\(category.spend, specifier: "%.2f")")
//                        .font(.title3.weight(.medium))
                    
                    Text("/ $\(category.target, specifier: "%.2f")")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text("35.21%")
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(.green.opacity(0.2))
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .foregroundColor(.green)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 150)
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .padding(.horizontal, 20)
    }
}

//struct FeaturedCategory_Previews: PreviewProvider {
//    static var previews: some View {
//        FeaturedCategory()
//    }
//}

//
//  AddExpenseView.swift
//  Funds
//
//  Created by Jake Quinter on 7/20/22.
//

import SwiftUI

struct AddExpenseView: View {
    var categories: [CategoryViewModel]
    
    @State private var name = ""
    @State private var spend = ""
    @State private var selectedCategory = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Add expense")
                .font(.title.bold())
                .padding(.bottom, 24)
            VStack(alignment: .leading, spacing: 4) {
                Text("Name")
                    .font(.subheadline.weight(.medium))
                
                TextField("Enter a name", text: $name)
                    .textFieldStyle(.roundedBorder)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Amount")
                    .font(.subheadline.weight(.medium))
                
                TextField("Enter an amount", text: $spend)
                    .textFieldStyle(.roundedBorder)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Category")
                    .font(.subheadline.weight(.medium))
                Picker("Please choose a category", selection: $selectedCategory) {
                    ForEach(categories) {
                        Text("\($0.name)")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Spacer()
            
            Button("Add expense"){
                print("name: \(name)")
                print("spend: \(spend)")
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }
}

//struct AddExpenseView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddExpenseView()
//    }
//}

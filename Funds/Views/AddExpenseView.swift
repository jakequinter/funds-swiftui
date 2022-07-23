//
//  AddExpenseView.swift
//  Funds
//
//  Created by Jake Quinter on 7/20/22.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = AddExpenseViewModel()
    var monthsViewModel: MonthsViewModel
 
    var body: some View {
        VStack(spacing: 16) {
            Text("Add expense")
                .font(.title.bold())
                .padding(.bottom, 24)
            VStack(alignment: .leading, spacing: 4) {
                Text("Name")
                    .font(.subheadline.weight(.medium))
                
                TextField("Enter a name", text: $viewModel.name)
                    .textFieldStyle(.roundedBorder)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Amount")
                    .font(.subheadline.weight(.medium))
                
                TextField("Enter an amount", text: $viewModel.spend)
                    .textFieldStyle(.roundedBorder)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Category")
                    .font(.subheadline.weight(.medium))
                Picker("Please choose a category", selection: $viewModel.categoryId) {
                    ForEach(monthsViewModel.categories) {
                        Text("\($0.name)")
                    }
                }
                .pickerStyle(.segmented)
                .onChange(of: viewModel.categoryId) { newValue in
                    print("NEW VALUE: \(newValue)")
                    handleExpenseType(categoryId: newValue)
                }
            }
            
            Spacer()
            
            Button("Add expense"){
                viewModel.addNewExpense()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .onChange(of: viewModel.expenseSaved, perform: { value in
            if value {
                monthsViewModel.fetchCurrentMonthCategoryExpenses(categoryIds: monthsViewModel.categories.map { $0.id })
                presentationMode.wrappedValue.dismiss()
            }
        })
    }
    
    func handleExpenseType(categoryId: String)  {
        let category = monthsViewModel.categories.first(where: { $0.id == categoryId })
        
        viewModel.type = category?.name ?? "unknown"
    }
}

//struct AddExpenseView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddExpenseView()
//    }
//}

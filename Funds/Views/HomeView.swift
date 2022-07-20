//
//  HomeView.swift
//  Funds
//
//  Created by Jake Quinter on 7/11/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel = MonthsViewModel()
    @ObservedObject private var categoriesViewModel = CategoriesViewModel()
    @ObservedObject private var expensesViewModel = ExpensesViewModel()
    
    @State private var isPresented = false;
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("\(viewModel.month.id ?? "ID not found")")
                TabView {
                    ForEach(categoriesViewModel.categories) { category in
                        GeometryReader { proxy in
                            let minX = proxy.frame(in: .global).minX
                            
                            FeaturedCategory(category: category)
                                .padding(.vertical, 40)
                                .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
                                .shadow(color: Color(.black).opacity(0.3), radius: 10, x: 0, y: 10)
                                .blur(radius: abs(minX / 40))

                        }
                    }
                }
                
                Section("Expenses") {
                    List() {
                        ForEach(expensesViewModel.expenses) { expense in
                            HStack {
                                Text(expense.name)
                                Spacer()
                                Text("$\(expense.spend)")
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .padding(.horizontal)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .sheet(isPresented: $isPresented, content: {
                AddExpenseView()
            })
            .onAppear() {
                viewModel.fetchCurrentMonth()
                expensesViewModel.fetchExpenses(categoryIds: ["HTgCYqrtmllMIsNAGLkG", "z9ndHFbWA3IMjHSMFcGY"])
            }
            .onChange(of: [viewModel.month.id]) { _ in
                if (viewModel.month.id != nil) {
                    categoriesViewModel.fetchCategories(monthId: viewModel.month.id!)
                }
            }
            .toolbar() {
                Button("Add expense", action: {
                    isPresented = true
                })
            }
            .navigationTitle("funds")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

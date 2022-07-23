//
//  HomeView.swift
//  Funds
//
//  Created by Jake Quinter on 7/11/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var monthsViewModel = MonthsViewModel()
    
    @State private var isPresented = false;
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                if monthsViewModel.loadingState == .loading {
                    LoadingView(loadingState: monthsViewModel.loadingState)
                } else if monthsViewModel.loadingState == .success && monthsViewModel.month == nil {
                    AddMonthView(monthsViewModel: monthsViewModel, hasCurrentMonth: $monthsViewModel.hasCurrentMonth)
                } else {
                    TabView {
                        ForEach(monthsViewModel.categories, id: \.id) { category in
                            GeometryReader { proxy in
                                let minX = proxy.frame(in: .global).minX
                                
                                FeaturedCategory(category: category, expenses: monthsViewModel.expenses )
                                    .padding(.vertical, 40)
                                    .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
                                    .shadow(color: Color(.black).opacity(0.3), radius: 10, x: 0, y: 10)
                                    .blur(radius: abs(minX / 40))
                                
                            }
                        }
                    }
                    .frame(height: 220)
                    
                    List {
                        ForEach(monthsViewModel.expenses) {expense in
                            HStack {
                                Text(expense.name)
                                Spacer()
                                Text("$\(expense.spend, specifier: "%.2f")")
                                
                                Text(expense.type)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .font(.caption2)
                                    .background(Capsule().fill(.blue.opacity(0.15)))
                            }
                        }
                    }
                    .listStyle(.plain)
                }
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .sheet(isPresented: $isPresented, onDismiss: {
                monthsViewModel.fetchCurrentMonthCategoryExpenses(categoryIds: monthsViewModel.categories.map {
                    $0.id
                })
            }, content: {
                AddExpenseView(monthsViewModel: monthsViewModel)
                    .presentationDetents([.medium])
            })
            .onAppear {
                monthsViewModel.fetchCurrentMonth()
            }
            .toolbar() {
                if !monthsViewModel.expenses.isEmpty {
                    Button("Add expense", action: {
                        isPresented = true
                    })
                }
            }
            .navigationTitle("funds")
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}

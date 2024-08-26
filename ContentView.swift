//
//  ContentView.swift
//  iExpenseSwiftData
//
//  Created by Reza Enayati on 8/25/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var showingAddView = false
    
    @State private var sortOrder = [
        SortDescriptor(\Expense.name),
        SortDescriptor(\Expense.amount, order: .reverse)
    ]
    @State private var filterSelection = "Business And Personal"
    
    var body: some View {
        NavigationStack {
            ExpenseListView(filter: filterSelection, sortOrder: sortOrder)
            .navigationTitle("iExpense")
            .toolbar{
                Button("Add", systemImage: "plus") {
                    showingAddView.toggle()
                }
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\Expense.name),
                                SortDescriptor(\Expense.amount, order: .reverse)
                            ])
                        Text("Sort by Amount")
                            .tag([
                                SortDescriptor(\Expense.amount, order: .reverse),
                                SortDescriptor(\Expense.name)
                            ])
                    }
                }
                Menu("Filter", systemImage: "line.3.horizontal.decrease.circle") {
                    Picker("Filter", selection: $filterSelection) {
                        Text("Business And Personal")
                            .tag("Business And Personal")
                        Text("Business")
                            .tag("Business")
                        Text("Personal")
                            .tag("Personal")
                    }
                }
            }
            .sheet(isPresented: $showingAddView, content: {
                AddView()
            })
        }
        
    }

    
}

#Preview {
    ContentView()
}

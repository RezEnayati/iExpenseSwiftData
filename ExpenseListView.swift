//
//  ExpenseListView.swift
//  iExpenseSwiftData
//
//  Created by Reza Enayati on 8/25/24.
//
import SwiftData
import SwiftUI

struct ExpenseListView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query var expenses: [Expense]
    
    var body: some View {
        List {
            ForEach(expenses) { expense in
                HStack {
                    VStack(alignment: .leading){
                        Text(expense.name)
                            .font(.headline)
                        Text(expense.type)
                    }
                    Spacer()
                    Text(expense.amount, format: .currency(code: "USD"))
                }
            }
            .onDelete(perform: removeExpense)
        }
    }
    
    init(filter: String, sortOrder: [SortDescriptor<Expense>]) {
        _expenses = Query(
            filter: {
                switch filter {
                case "Business And Personal":
                    return #Predicate<Expense> {_ in true}
                case "Business":
                    return #Predicate<Expense> {expense in
                        expense.type == "Business"}
                case "Personal":
                    return #Predicate<Expense> { expense in
                        expense.type == "Personal"}
                default:
                    return #Predicate<Expense> { _ in true  }
                }
            }(), sort: sortOrder)
    }
    
    func removeExpense(at offsets: IndexSet) {
        for index in offsets {
            let item = expenses[index]
            modelContext.delete(item)
        }
    }
}

//#Preview {
//    ExpenseListView()
//}

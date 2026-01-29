//
//  ExpenseDetailView.swift
//  BudgetTracker
//
//  Created by Rik Roy on 8/21/25.
//

import SwiftUI

struct ExpenseDetailView: View {
    @Binding var expense: Expense
    @State var viewModel: BudgetViewModel
    var body: some View {
        List {
            Section(header: Text("Expense Info")) {
                // TODO: Create a row for editing the expense name
                HStack{
                    Text("Name").bold()
                    Spacer()
                    TextField("", text: $expense.name).multilineTextAlignment(.trailing)
                }
                // TODO: Create a row for editing the expense amount
                HStack{
                    Text("Amount").bold()
                    Spacer()
                    TextField("", text: Binding(get: {"$\(String(format: "%.2f", expense.amount))"}, set: {newValue in if let value = Double(newValue) {expense.amount = value}})).multilineTextAlignment(.trailing)
                }
            }
        }
        .scrollContentBackground(.hidden)
        .navigationTitle("Edit Expense")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}
#Preview {
    ExpenseDetailView(expense: .constant(Expense(name: "Pizza", amount: 56.34)), viewModel: BudgetViewModel())
}

//
//  ContentView.swift
//  BudgetTracker
//
//  Created by Rik Roy on 8/20/25.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = BudgetViewModel()
    @State private var expenseName = ""
    @State private var expenseAmount = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                VStack(spacing: 10) {
                    // MARK: - Budget Header
                    Text("Budget Tracker")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    // TODO: Show remaining budget here
                    // Note: Budget can change color in certain cases
                    Text("$\(viewModel.remainingBudget, specifier: "%.2f")").font(.title).fontWeight(.bold).foregroundColor(viewModel.budgetColor)
                    
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                
                // MARK: - Add Expense Form
                VStack(spacing: 15) {
                    
                    // TODO: TextField for expense name

                    TextField("", text: $expenseName, prompt: Text("Expense Name")).frame(maxWidth: .infinity, maxHeight: 50).padding(.horizontal, 10).background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    
                    // TODO: TextField for expense amount
                    TextField("", text: $expenseAmount, prompt: Text("Amount")).frame(maxWidth: .infinity, maxHeight: 50).padding(.horizontal, 10).background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    
                    Button {
                        // TODO: Add expense and remember to clear the fields
                        if let doubleAmount = Double(expenseAmount) {
                            viewModel.addExpense(name: expenseName, amount: doubleAmount)
                        }
                        expenseName = ""
                        expenseAmount = ""
                    } label: {
                        Text("Add Expense")
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.blue)
                            )
                            .foregroundStyle(.white)
                        
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                
                // MARK: - Expenses List
                VStack(alignment: .leading, spacing: 10) {
                    Text("Expenses")
                        .font(.headline)
                    
                    // TODO: If there are no expenses, show "No expenses yet"
                    if viewModel.isEmpty {
                        Text("No expenses yet").foregroundStyle(.gray).italic()
                    } else {
                        ForEach($viewModel.expenses) { $expense in
                            // TODO: Wrap each expense in a NavigationLink
                            // Destination should be ExpenseDetailView(expense: $expense, viewModel: viewModel)
                            
                            // Inside the row, display:
                            // - Expense name
                            // - Expense amount
                            // - A delete button
                            NavigationLink(destination:ExpenseDetailView(expense: $expense, viewModel: viewModel)) {
                                HStack {
                                    Text("\(expense.name)").foregroundStyle(.blue)
                                    Spacer()
                                    Text("$\(expense.amount, specifier: "%.2f")").foregroundStyle(.blue).bold()
                                    Button {
                                        viewModel.removeExpense(expense: expense)
                                    } label: {
                                        Text("Delete").foregroundStyle(.red)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                
                Spacer()
            }
            .padding()
        }
        .padding()
        .navigationTitle("Budget Tracker")
    }
}

#Preview {
    ContentView()
}

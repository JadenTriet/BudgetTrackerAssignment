//
//  BudgetViewModel.swift
//  BudgetTracker
//
//  Created by Rik Roy on 8/21/25.
//

import SwiftUI

@Observable class BudgetViewModel {
    var expenses: [Expense] = []
    
    var remainingBudget: Double {
        // TODO: Calculate the remaining budget
        // Hint: Start with 500.0 and subtract the sum of all expense amounts
        var total : Double = 0
        for x in expenses {
            total += x.amount
        }
        return 500.0 - total
    }
    
    var budgetColor: Color {
        // TODO: Return .green if remainingBudget > 0, otherwise .red
        if remainingBudget > 0 {
            return .green
        } else {
            return .red
        }
    }
    
    var isEmpty : Bool {
        return expenses.isEmpty
    }
    
    func addExpense(name: String, amount: Double) {
        // TODO: Create a new Expense and add it to the expenses array
        let newExpense : Expense = Expense(name: name, amount: amount)
        expenses.append(newExpense)
    }
    
    func removeExpense(expense: Expense) {
        // TODO: Find the index of the given expense and remove it from the array
        for (index, value) in expenses.enumerated() {
            if value == expense {
                expenses.remove(at: index)
            }
        }
    }
}

//
//  Expense.swift
//  iExpenseSwiftData
//
//  Created by Reza Enayati on 8/25/24.
//

import Foundation
import SwiftData

@Model
class Expense {
    var name: String
    var type: String
    var amount: Double
    
    init(name: String, type: String, amount: Double) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}


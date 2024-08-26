//
//  iExpenseSwiftDataApp.swift
//  iExpenseSwiftData
//
//  Created by Reza Enayati on 8/25/24.
//

import SwiftData
import SwiftUI

@main
struct iExpenseSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Expense.self)
    }
}

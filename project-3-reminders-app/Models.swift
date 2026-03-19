//
//  Models.swift
//  project-3-reminders-app
//
//  Created by Valentyn Savich on 3/19/26.
//

import SwiftUI

struct Reminder: Identifiable {
    var id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
}

struct RemindersPage: Identifiable {
    var id: UUID = UUID()
    var title: String
    var items: [Reminder]
    var color: Color
}

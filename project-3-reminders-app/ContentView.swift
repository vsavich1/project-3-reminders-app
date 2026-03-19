//
//  ContentView.swift
//  project-3-reminders-app
//
//  Created by Valentyn Savich on 3/19/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isEditing: Bool = false
    // TODO: Add an @State property to hold a RemindersPage struct
    @State private var page: RemindersPage = RemindersPage(
        title: "Grocery List",
        items: [Reminder(title: "Apples", isCompleted: false), Reminder(title: "Carrots", isCompleted: false)],
        color: .green
    )
    
    var body: some View {
        VStack {
            // TODO: Add header view
            HStack {
                Text(page.title)
                    .font(.largeTitle)
                    .bold()
                
                Spacer()
                
                Button {
                    isEditing = true
                } label: {
                    Image(systemName: "info.circle")
                }
            }
            .foregroundStyle(page.color)
            .padding()
            
            List {
                // TODO: Loop through the page's reminders using ForEach
                ForEach($page.items) { $reminder in
                    // TODO: Display each reminder row
                }
                .onDelete { indexSet in
                    page.items.remove(atOffsets: indexSet)
                }
            }
            .listStyle(.plain)
            
            // TODO: Add footer view

        }
        .sheet(isPresented: $isEditing) {
            // TODO: Add remaining binding
            EditSheet(title: $page.title, selectedColor: $page.color)
        }
    }
}

#Preview {
    ContentView()
}

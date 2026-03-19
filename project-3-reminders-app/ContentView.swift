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
    // initialize the page to have something to work with
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
                        .font(.title3)
                        .fontWeight(.semibold)
                }
            }
            .foregroundStyle(page.color)
            .padding()
            
            List {
                // TODO: Loop through the page's reminders using ForEach
                ForEach($page.items) { $reminder in
                    // TODO: Display each reminder row
                    HStack {
                        // check button
                        if reminder.isCompleted {
                            Button {
                                reminder.isCompleted = false
                            } label: {
                                Image(systemName: "circle.fill")
                                    .foregroundStyle(page.color)
                            }
                            .buttonStyle(.plain)
                        } else {
                            Button {
                                reminder.isCompleted = true
                            } label: {
                                Image(systemName: "circle")
                                    .foregroundStyle(page.color)
                            }
                            .buttonStyle(.plain)
                        }
                        
                        // editable reminder text
                        TextField(reminder.title, text: $reminder.title)
                    }
                }
                .onDelete { indexSet in
                    page.items.remove(atOffsets: indexSet)
                }
            }
            .listStyle(.plain)
            
            // TODO: Add footer view
            VStack {
                Button {
                    page.items.append(Reminder(title: "", isCompleted: false))
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(page.color)
                        .font(.system(size: 50))
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing)

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

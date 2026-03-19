//
//  EditSheet.swift
//  project-3-reminders-app
//
//  Created by Valentyn Savich on 3/19/26.
//

import SwiftUI

struct EditSheet: View {
    // TODO: Add title binding
    @Binding var title: String
    @Binding var selectedColor: Color
    
    var body: some View {
        VStack(spacing: 20) {
                // TODO: Add list.bullet.circle.fill icon and TextField
            VStack(spacing: 15) {
                Image(systemName: "list.bullet.circle.fill")
                    .font(.system(size: 70))
                    .padding(.horizontal)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                
                TextField("List Title", text: $title)
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal, 40)
                    .padding(.vertical, 15)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(Color.secondary)
                            .opacity(0.3)
                    )
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(Color.secondary)
                    .opacity(0.15)
            )
            
            ColorChooser(selectedColor: $selectedColor)
            
            Spacer()
        }
        .foregroundStyle(selectedColor)
        .padding()
    }
}

#Preview {
    @Previewable @State var title: String = "My List"
    @Previewable @State var selectedColor: Color = .red
    
    EditSheet(title: $title, selectedColor: $selectedColor)
        //.preferredColorScheme(.dark)
}

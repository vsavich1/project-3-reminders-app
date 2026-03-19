//
//  EditSheet.swift
//  project-3-reminders-app
//
//  Created by Valentyn Savich on 3/19/26.
//

import SwiftUI

struct EditSheet: View {
    // TODO: Add title binding
    @Binding var selectedColor: Color
    
    var body: some View {
        VStack(spacing: 20) {
                // TODO: Add list.bullet.circle.fill icon and TextField
            
            ColorChooser(selectedColor: $selectedColor)
            
            Spacer()
        }
        .foregroundStyle(selectedColor)
        .padding()
    }
}

#Preview {
    @Previewable @State private var selectedColor: Color = .red
    
    EditSheet(selectedColor: $selectedColor)
        .preferredColorScheme(.dark)
}

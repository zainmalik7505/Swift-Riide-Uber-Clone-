//
//  LocationSearchActivateView.swift
//  Swift Riide
//
//  Created by Zain Malik on 03/09/2024.
//

import SwiftUI

struct LocationSearchActivateView: View {
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.theme.primaryTextColor)
                .frame(width: 8, height: 8)
                .padding(.leading, 16)
            
            Text("Where to go?")
                .font(.body)
                .foregroundColor(Color.theme.primaryTextColor)
                .padding(.leading, 8)
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .frame(height: 60)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.theme.backgroundColor)
                .shadow(color: Color.theme.backgroundColor.opacity(0.2), radius: 10, x: 0, y: 4)
        )
        .cornerRadius(10)
        .padding(.horizontal, 16)
    }
}

#Preview {
    LocationSearchActivateView()
}

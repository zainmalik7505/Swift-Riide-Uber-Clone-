//
//  LocationSearchResultCell.swift
//  Swift Riide
//
//  Created by Zain Malik on 03/09/2024.
//

import SwiftUI


struct LocationSearchResultCell: View {
    
    let title: String
    let subTitle: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.blue)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(Color.theme.primaryTextColor)
                
                Text(subTitle)
                    .font(.subheadline)
                    .foregroundColor(Color.theme.primaryTextColor)
                
                Divider()
                    .background(Color.gray.opacity(0.3))
            }
            .padding(.leading, 8)
            .padding(.vertical, 8)
        }
        .padding(.horizontal)
        .background(Color.theme.backgroundColor)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        .frame(maxWidth: .infinity) 
    }
}

#Preview {
    LocationSearchResultCell(title: "New Town", subTitle: "Street 10, Blue Area, Islamabad")
}

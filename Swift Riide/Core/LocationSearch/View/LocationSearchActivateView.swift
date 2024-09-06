//
//  LocationSearchActivateView.swift
//  Swift Riide
//
//  Created by Zain Malik on 03/09/2024.
//

import SwiftUI

struct LocationSearchActivateView: View {
    var body: some View {
        HStack{
            Rectangle()
                .fill(Color.black)
                .frame(width: 8, height: 8)
                .padding(.horizontal)
            
            Text("Where to go?")
                .foregroundStyle(Color(.darkGray))
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 64, height: 50)
        .background(
            Rectangle()
                .fill(Color.white)
                .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        )
    }
}

#Preview {
    LocationSearchActivateView()
}

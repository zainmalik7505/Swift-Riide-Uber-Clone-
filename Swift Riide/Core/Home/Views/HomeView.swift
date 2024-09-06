//
//  HomeView.swift
//  Swift Riide
//
//  Created by Zain Malik on 02/09/2024.
//

import SwiftUI
import MapKit

struct HomeView: View {
    var body: some View {
        MapViewRepresentable()
            .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}

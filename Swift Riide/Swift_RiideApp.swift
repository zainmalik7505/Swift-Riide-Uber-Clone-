//
//  Swift_RiideApp.swift
//  Swift Riide
//
//  Created by Zain Malik on 02/09/2024.
//

import SwiftUI

@main
struct Swift_RiideApp: App {
    
    @StateObject var locationViewModel = LocationSearchViewModel()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}

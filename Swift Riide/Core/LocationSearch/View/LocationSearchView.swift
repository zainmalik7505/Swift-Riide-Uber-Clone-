//
//  LocationSearchView.swift
//  Swift Riide
//
//  Created by Zain Malik on 03/09/2024.
//

import SwiftUI


struct LocationSearchView: View {
    
    @State private var startLocationText = ""
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack(spacing: 12) {
                    VStack {
                        Circle()
                            .fill(Color(.systemGray3))
                            .frame(width: 6, height: 6)
                        
                        Rectangle()
                            .fill(Color(.systemGray3))
                            .frame(width: 1, height: 24)
                        
                        Rectangle()
                            .fill(Color(.black))
                            .frame(width: 6, height: 6)
                    }
                    
                    VStack(spacing: 10) {
                        // Current Location TextField
                        TextField("Current Location", text: $startLocationText)
                            .padding(.leading, 12)
                            .frame(height: 40)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                        
                        // Destination TextField
                        TextField("Where to go?", text: $viewModel.queryFragment)
                            .padding(.leading, 12)
                            .frame(height: 40)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 130)
                
                Divider()
                    .padding(.vertical, 8)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(viewModel.results, id: \.self) { result in
                            LocationSearchResultCell(title: result.title, subTitle: result.subtitle)
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        viewModel.selectLocation(result)
                                        mapState = .locationSelected
                                    }
                                }
                                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                        }
                    }
                    .padding(.horizontal, 8)
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top) // Ensure full width and height
            }
            .background(Color.theme.backgroundColor) // Ensure background color covers the entire view
            .edgesIgnoringSafeArea(.all) // Make sure the view covers the entire screen
        }
    }
}

#Preview {
    LocationSearchView(mapState: .constant(.searchingForLocation))
}

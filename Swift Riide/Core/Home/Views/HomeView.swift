//
//  HomeView.swift
//  Swift Riide
//
//  Created by Zain Malik on 02/09/2024.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    @State private var mapState = MapViewState.noInput
    @EnvironmentObject var viewModel: LocationSearchViewModel
//    @State private var showSearchLocationView: Bool = false
//    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                MapViewRepresentable(mapState: $mapState)
                    .ignoresSafeArea()
                
                
                if mapState == .searchingForLocation{
                    LocationSearchView(mapState: $mapState)
                }else if mapState == .noInput{
                    LocationSearchActivateView()
                        .padding(.top, 60)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                mapState = .searchingForLocation
                            }
                        }
                }
                
                
                MapViewActionButton(mapState: $mapState)
                    .padding(.leading)
            }
            
            if mapState == .locationSelected || mapState == .polyLineAdded{
                RideRequestView()
                    .transition(.move(edge: .bottom))
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .onReceive(LocationManager.shared.$userLocation, perform: { location in
            if let location = location{
                viewModel.userLocation = location
            }
        })
    }
}

#Preview {
    HomeView()
}

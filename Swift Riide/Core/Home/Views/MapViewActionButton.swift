//
//  MapVIewActionButton.swift
//  Swift Riide
//
//  Created by Zain Malik on 03/09/2024.
//

import SwiftUI

struct MapViewActionButton: View {
    
//    @Binding var showLocationSearchView: Bool
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        Button {
                withAnimation(.spring()) {
                    actionForState(mapState)
                }
        } label: {
            Image(systemName: imageNameForState(mapState))
                .font(.title2)
                .foregroundColor(Color.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black , radius: 6)
        }
        .frame(maxWidth: .infinity , alignment: .leading)
    }
    
    func actionForState(_ state: MapViewState){
        switch state{
        case .noInput:
            print("No Input")
        case .searchingForLocation:
            mapState = .noInput
        case .locationSelected, .polyLineAdded:
            mapState = .noInput
            viewModel.selectedSwiftLocation = nil
        }
    }
    
    func imageNameForState(_ state: MapViewState) -> String{
        switch state{
        case .noInput:
            return "line.3.horizontal"
        case .searchingForLocation , .locationSelected, .polyLineAdded:
            return "arrow.left"
//        default:
//            return "line.3.horizontal"
        }
    }
}

#Preview {
    MapViewActionButton(mapState: .constant(.noInput))
}

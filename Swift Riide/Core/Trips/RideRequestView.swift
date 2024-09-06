//
//  RideRequestView.swift
//  Swift Riide
//
//  Created by Zain Malik on 05/09/2024.
//

import SwiftUI

struct RideRequestView: View {
    
    @State private var selectedRideType: RideType = .uberX
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            // Capsule Handle
            Capsule()
                .foregroundColor(Color(.systemGray4))
                .frame(width: 50, height: 6)
                .padding(.top, 8)
            
            // Ride Information
            HStack(spacing: 16) {
                VStack {
                    Circle()
                        .fill(Color(.systemGray4))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray4))
                        .frame(width: 1, height: 24)
                    
                    Rectangle()
                        .fill(Color(.black))
                        .frame(width: 6, height: 6)
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Current Location")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Spacer()
                        Text(locationViewModel.pickUpTime ?? "0:00")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Text(locationViewModel.selectedSwiftLocation?.title ?? "Destination")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Spacer()
                        Text(locationViewModel.dropOfTime ?? "0:00")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 4)
            
            // Suggested Rides
            VStack(alignment: .leading, spacing: 8) {
                Text("Suggested Rides")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.leading, 16)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(RideType.allCases) { rideType in
                            VStack(alignment: .center, spacing: 8) {
                                Image(rideType.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                
                                Text(rideType.descrpition)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                
                                Text(locationViewModel.computeRidePrice(forType: rideType).toCurrency())
                                    .font(.footnote)
                                    .fontWeight(.bold)
                            }
                            .padding()
                            .frame(width: 120, height: 160)
                            .background(rideType == selectedRideType ? Color.blue : Color.theme.secondaryBackgroundColor)
                            .cornerRadius(12)
                            .shadow(color: .black.opacity(0.1), radius: 4)
                            .scaleEffect(selectedRideType == rideType ? 1.0 : 0.9)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedRideType = rideType
                                }
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(rideType == selectedRideType ? Color.blue : Color.clear, lineWidth: 2)
                            )
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            Divider()
                .padding(.vertical, 8)
            
            // Payment Method
            HStack {
                HStack(spacing: 8) {
                    Text("Visa")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .padding(8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(6)
                    
                    Text("**** 1234")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .padding()
            }
            .frame(height: 60)
            .background(Color.theme.secondaryBackgroundColor)
            .cornerRadius(10)
            .padding(.horizontal)
            
            // Confirm Ride Button
            Button(action: {
                // Confirm Ride Action
            }) {
                Text("CONFIRM RIDE")
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(color: .blue.opacity(0.3), radius: 10)
            }
            .padding(.horizontal)
        }
        .padding(.bottom, 24)
        .background(Color.theme.backgroundColor)
        .cornerRadius(16)
        .shadow(radius: 20)
    }
}

#Preview {
    RideRequestView()
}

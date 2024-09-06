//
//  RideType.swift
//  Swift Riide
//
//  Created by Zain Malik on 05/09/2024.
//

import Foundation

enum RideType : Int, Identifiable, CaseIterable{
    case uberX
    case black
    case uberXL
    case uberB
    
    var id: Int { return rawValue }
    
    var descrpition : String{
        switch self{
        case .uberX : return "Swift X"
        case .black : return "Swift Black"
        case .uberXL : return "Swift XL"
        case .uberB  : return "Swift Pro"
        }
    }
    
    var imageName: String{
        switch self{
        case .uberX : return "uber-x"
        case .black : return "uber-black"
        case .uberXL : return "UberBlackXL"
        case .uberB : return "UberBlack-B"
        }
    }
    
    
    var baseFare: Double{
        switch self{
        case .uberX : return 5
        case .black: return 20
        case .uberXL: return 10
        case .uberB: return 25
            
        }
    }
    
    func computePrice(for distanceInMeters:Double) -> Double{
        let distanceInMiles = distanceInMeters / 1600
        
        switch self{
        case .uberX : return distanceInMiles * 1.5 + baseFare
        case .black: return distanceInMiles * 2.0 + baseFare
        case .uberXL: return distanceInMiles * 1.75 + baseFare
        case .uberB: return distanceInMiles * 3 + baseFare
            
        }
        
    }
}

//
//  Location.swift
//  CaritasMty
//
//  Created by Alumno on 13/10/23.
//



import Foundation

struct Location: Codable {
    var lat: Double
    var lng: Double

    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lng = "lng"

        
    }

    init(lat: Double, lng: Double) {
        self.lat = lat
        self.lng = lng
    }
}



//
//  GetLocation.swift
//  CaritasMty
//
//  Created by Alumno on 13/10/23.
//


import Foundation

func callLocation(ticketID: Int, token: String) -> Location {
    
    var coordenadas: Location = Location(lat: 0.0, lng: 0.0)
    
    var request = URLRequest(url: URL(string: "https://equipo02.tc2007b.tec.mx:10206/get-geolocation?ticketId=\(ticketID)")!, timeoutInterval: Double.infinity)
    request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

    request.httpMethod = "GET"

    let group = DispatchGroup()
    
    group.enter()

    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        let jsonDecoder = JSONDecoder()

        if let data = data {
            do {
                let ticketList = try jsonDecoder.decode(Location.self, from: data)
                coordenadas = ticketList
            } catch {
                print(error)
            }
        }

        group.leave()
    }

    task.resume()
    group.wait()

    return coordenadas
}


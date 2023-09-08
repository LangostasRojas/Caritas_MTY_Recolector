//
//  GetTicket.swift
//  CaritasMtyRepartidor
//
//  Created by Alumno on 07/09/23.
//

import Foundation


func callTickets(userID: Int,token: String) -> [Ticket] {
    var lista: [Ticket] = []
    var request = URLRequest(url: URL(string: "http://10.22.163.240:10201/get-recolector-tickets?userId=\(userID)")!, timeoutInterval: Double.infinity)
    request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

    request.httpMethod = "GET"

    let group = DispatchGroup()
    group.enter()

    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        let jsonDecoder = JSONDecoder()

        if let data = data {
            do {
                let ticketList = try jsonDecoder.decode([Ticket].self, from: data)
                lista = ticketList
            } catch {
                print(error)
            }
        }

        group.leave()
    }

    task.resume()
    group.wait()

    return lista
}

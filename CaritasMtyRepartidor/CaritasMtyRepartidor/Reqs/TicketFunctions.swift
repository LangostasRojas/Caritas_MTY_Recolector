//
//  GetTicket.swift
//  CaritasMtyRepartidor
//
//  Created by Alumno on 07/09/23.
//

import Foundation


func callTickets(userID: Int,token: String) -> [Ticket] {
    
    var lista: [Ticket] = []
    
    var request = URLRequest(url: URL(string: "https://equipo02.tc2007b.tec.mx:10206/get-recolector-tickets?userId=\(userID)")!, timeoutInterval: Double.infinity)
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


func completeTicket(ticketID: Int, token: String, estatus: Int, completion: @escaping (Bool, Error?) -> Void) {
    guard let url = URL(string:"https://equipo02.tc2007b.tec.mx:10206/mark-completed") else {
        completion(false, NSError(domain: "Invalid URL", code: 400, userInfo: nil))
        return
    }
    
    let body: [String: Any] = [
        "ticketId": "\(ticketID)",
        "estatus": "\(estatus)"
    ]
    
    let jsonData = try? JSONSerialization.data(withJSONObject: body)
    
    var request = URLRequest(url: url)
    
    request.httpMethod = "POST"
    request.httpBody = jsonData
    request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    URLSession.shared.dataTask(with: request){
        data, response, error in
        if let error = error{
            DispatchQueue.main.async {
                completion(false, error)
            }
            return
        }
        guard let httpResponse = response as? HTTPURLResponse else {
            DispatchQueue.main.async {
                completion(false, NSError(domain: "Invalid Response", code: 500))
            }
            return
        }
        if httpResponse.statusCode == 200 {
            do {
                DispatchQueue.main.async {
                    completion(true, nil)
                }
            }
            catch {
                DispatchQueue.main.async {
                    completion(false, error)
                }
            }
        }
        else {
            DispatchQueue.main.async {
                completion(false, NSError(domain: "Server Error", code: httpResponse.statusCode))
            }
        }
    }.resume()
    return

}

func markOnRouteTicket(ticketID: Int, token: String, estatus: Int, completion: @escaping (Bool, Error?) -> Void) {
    guard let url = URL(string:"https://equipo02.tc2007b.tec.mx:10206/mark-visit") else{
        completion(false, NSError(domain: "Invalid URL", code: 400, userInfo: nil))
        return
    }
    
    let body: [String: Any] = [
        "ticketId": "\(ticketID)",
        "estatus": "\(estatus)"
    ]
    
    let jsonData = try? JSONSerialization.data(withJSONObject: body)
    
    var request = URLRequest(url: url)
    
    request.httpMethod = "POST"
    request.httpBody = jsonData
    request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    URLSession.shared.dataTask(with: request){
        data, response, error in
        if let error = error{
            DispatchQueue.main.async {
                completion(false, error)
            }
            return
        }
        guard let httpResponse = response as? HTTPURLResponse else {
            DispatchQueue.main.async {
                completion(false, NSError(domain: "Invalid Response", code: 500))
            }
            return
        }
        if httpResponse.statusCode == 200 {
            do {
                DispatchQueue.main.async {
                    completion(true, nil)
                }
            }
            catch {
                DispatchQueue.main.async {
                    completion(false, error)
                }
            }
        }
        else {
            DispatchQueue.main.async {
                completion(false, NSError(domain: "Server Error", code: httpResponse.statusCode))
            }
        }
    }.resume()
    return
}

func sendComment(ticketID: Int, token: String, comment: Int, completion: @escaping (Bool, Error?) -> Void) {
    guard let url = URL(string:"https://equipo02.tc2007b.tec.mx:10206/set-comment") else{
        completion(false, NSError(domain: "Invalid URL", code: 400, userInfo: nil))
        return
    }
    
    let body: [String: Any] = [
        "ticketId": "\(ticketID)",
        "comment": "\(comment)"
    ]
    
    let jsonData = try? JSONSerialization.data(withJSONObject: body)
    
    var request = URLRequest(url: url)
    
    request.httpMethod = "POST"
    request.httpBody = jsonData
    request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    URLSession.shared.dataTask(with: request){
        data, response, error in
        if let error = error{
            DispatchQueue.main.async {
                completion(false, error)
            }
            return
        }
        guard let httpResponse = response as? HTTPURLResponse else {
            DispatchQueue.main.async {
                completion(false, NSError(domain: "Invalid Response", code: 500))
            }
            return
        }
        if httpResponse.statusCode == 200 {
            do {
                DispatchQueue.main.async {
                    completion(true, nil)
                }
            }
            catch {
                DispatchQueue.main.async {
                    completion(false, error)
                }
            }
        }
        else {
            DispatchQueue.main.async {
                completion(false, NSError(domain: "Server Error", code: httpResponse.statusCode))
            }
        }
    }.resume()
    return
}

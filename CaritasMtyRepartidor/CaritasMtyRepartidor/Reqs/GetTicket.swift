//
//  GetTicket.swift
//  CaritasMtyRepartidor
//
//  Created by Alumno on 07/09/23.
//

import Foundation


func callAPILista(userID : Int) -> Array<Ticket> {
    var lista: Array<Ticket> = []
    guard let url = URL(string:"http://10.14.255.66:10204/get-recolector-tickets?recolectorId=\(userID)") else{
        return lista
    }
    
    let group = DispatchGroup()
    group.enter()
    
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        let jsonDecoder = JSONDecoder()
        if (data != nil){
            do{
                let ticketList = try jsonDecoder.decode([Ticket].self, from: data!)
                lista = ticketList
                for ticketItem in ticketList {
                    print("Id: \(ticketItem.id) - Nombre: \(ticketItem.nombre) ")
                }
            }catch{
                print(error)
            }
        }
    }
    task.resume()
    group.wait()
    return lista
}



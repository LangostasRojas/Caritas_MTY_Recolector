//
//  Ticket.swift
//  CaritasMtyRepartidor
//
//  Created by Alumno on 06/09/23.
//

import Foundation


struct Ticket: Codable, Identifiable {
    var id: Int
    var nombre: String
    var importe: Float
    var direccion: String
    var estatusVisita: Int

    enum CodingKeys: String, CodingKey {
        case id = "idTicket"
        case nombre = "nombre"
        case importe = "importe"
        case direccion = "direccion"
        case estatusVisita = "estatusVisita"
    }

    init(id: Int, nombre: String, importe: Float, direccion: String, estatusVisita: Int) {
        self.id = id
        self.nombre = nombre
        self.importe = importe
        self.direccion = direccion
        self.estatusVisita = estatusVisita
    }
}

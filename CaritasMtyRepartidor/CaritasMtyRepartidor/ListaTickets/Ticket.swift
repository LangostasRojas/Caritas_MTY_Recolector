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

    enum CodingKeys: String, CodingKey {
        case id = "idDonativo"
        case nombre = "nombre"
        case importe = "importe"
        case direccion = "direccion"
    }

    init(id: Int, nombre: String, importe: Float, direccion: String) {
        self.id = 1
        self.nombre = nombre
        self.importe = importe
        self.direccion = direccion
    }
}

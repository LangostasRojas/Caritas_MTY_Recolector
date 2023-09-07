//
//  Ticket.swift
//  CaritasMtyRepartidor
//
//  Created by Alumno on 06/09/23.
//

import Foundation


struct Ticket: Codable, Identifiable{

    var id: Int
    var nombre : String
    var cantidad : Float
    var estado : Bool
    var direccion: String
    
    init(id: Int,nombre: String, cantidad: Float, estado: Bool, direccion: String) {
        self.id = id
        self.nombre = nombre
        self.cantidad = cantidad
        self.estado = estado
        self.direccion = direccion
    }
}

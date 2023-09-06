//
//  ModelData.swift
//  CaritasMtyRepartidor
//
//  Created by Alumno on 06/09/23.
//

import Foundation

var listaTickets = cargarDatos()

func cargarDatos() -> Array<Ticket>{
    var tickets = [
        Ticket(id: 1, nombre: "Jair", cantidad: 100, estado: false, direccion:"Ciudad Gotica"),
        Ticket(id: 2, nombre: "Rodrigo", cantidad: 200000.2, estado: false, direccion:"Ciudad Gotica"),
        Ticket(id: 3, nombre: "Kraken", cantidad: 4, estado: false, direccion:"Ciudad Gotica"),
        Ticket(id: 4, nombre: "Minja", cantidad: 40400, estado: false, direccion:"Ciudad Gotica"),
        Ticket(id: 1, nombre: "Jair", cantidad: 100, estado: false, direccion:"Ciudad Gotica"),
        Ticket(id: 2, nombre: "Rodrigo", cantidad: 200000.2, estado: false, direccion:"Ciudad Gotica"),
        Ticket(id: 3, nombre: "Kraken", cantidad: 4, estado: false, direccion:"Ciudad Gotica"),
        Ticket(id: 4, nombre: "Minja", cantidad: 40400, estado: false, direccion:"Ciudad Gotica"),
        Ticket(id: 1, nombre: "Jair", cantidad: 100, estado: false, direccion:"Ciudad Gotica"),
        Ticket(id: 2, nombre: "Rodrigo", cantidad: 200000.2, estado: false, direccion:"Ciudad Gotica"),
        Ticket(id: 3, nombre: "Kraken", cantidad: 4, estado: false, direccion:"Ciudad Gotica"),
        Ticket(id: 4, nombre: "Minja", cantidad: 40400, estado: false, direccion:"Ciudad Gotica")
    ]
    return tickets
}

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
        Ticket(id: 5, nombre: "Juancho", cantidad: 100, estado: false, direccion:"Ciudad Gotica"),
        Ticket(id: 8, nombre: "Jose", cantidad: 200000.2, estado: false, direccion:"Ciudad Gotica"),
        Ticket(id: 9, nombre: "Jeremías", cantidad: 4, estado: false, direccion:"Ciudad Gotica"),
        Ticket(id: 10, nombre: "Jostal", cantidad: 40400, estado: false, direccion:"Ciudad Gotica"),
        Ticket(id: 11, nombre: "Jesús", cantidad: 100, estado: false, direccion:"Ciudad Gotica"),
        Ticket(id: 12, nombre: "Josefino", cantidad: 200000.2, estado: false, direccion:"Ciudad Gotica"),
        Ticket(id: 13, nombre: "Joserensino", cantidad: 4, estado: false, direccion:"Ciudad Gotica"),
        Ticket(id: 14, nombre: "Diego", cantidad: 40400, estado: false, direccion:"Ciudad Gotica")
    ]
    return tickets
}

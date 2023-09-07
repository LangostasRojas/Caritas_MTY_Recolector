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
        Ticket(id: 2, nombre: "Jair", cantidad: 100, estado: false, direccion:"Ciudad Gotica"),
        Ticket(id: 3, nombre: "Jair", cantidad: 100, estado: false, direccion:"Ciudad Gotica"),
        Ticket(id: 4, nombre: "Jair", cantidad: 100, estado: false, direccion:"Ciudad Gotica"),
        Ticket(id: 5, nombre: "Jair", cantidad: 100, estado: false, direccion:"Ciudad Gotica"),
        Ticket(id: 6, nombre: "Jair", cantidad: 100, estado: false, direccion:"Ciudad Gotica"),
        Ticket(id: 7, nombre: "Jair", cantidad: 100, estado: false, direccion:"Ciudad Gotica")

        
    ]
    return tickets
}

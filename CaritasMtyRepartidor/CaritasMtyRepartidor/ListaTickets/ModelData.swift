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
        Ticket(id: 4, nombre: "Minja", importe: 40400, direccion:"Ciudad Gotica", estatusVisita: 0),
        Ticket(id: 5, nombre: "Juancho", importe: 100, direccion:"Ciudad Gotica", estatusVisita: 0),
        Ticket(id: 8, nombre: "Jose", importe: 200000.2,direccion:"Ciudad Gotica", estatusVisita: 0)
    ]
    return tickets
}

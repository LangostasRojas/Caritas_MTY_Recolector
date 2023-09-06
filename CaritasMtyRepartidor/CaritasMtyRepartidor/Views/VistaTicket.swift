//
//  VistaTicket.swift
//  CaritasMtyRepartidor
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct VistaTicket: View {
        var ticket : Ticket
        var body: some View {
            Text("Ticket")
            Text("ID: \(ticket.id)")
            Text("Nombre: \(ticket.nombre)")
            Text("cantidad: \(ticket.cantidad)")
        }
}

struct VistaTicket_Previews: PreviewProvider {
    static var previews: some View {
        VistaTicket(ticket: listaTickets[0])
    }
}

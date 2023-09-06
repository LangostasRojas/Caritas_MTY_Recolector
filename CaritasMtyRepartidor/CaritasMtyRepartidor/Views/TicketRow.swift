//
//  TicketRow.swift
//  CaritasMtyRepartidor
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct TicketRow: View {
    var ticket : Ticket
    var body: some View {
        HStack{
            Text("\(ticket.id)")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .fontWeight(.bold)
            Text("\(ticket.nombre)")
                .font(.title)
            Text("$ \(String(format: "%.2f", ticket.cantidad))")
                .font(.title)
            
        }
    }
}

struct JugadorRow_Previews: PreviewProvider {
    static var previews: some View {
        TicketRow(ticket: listaTickets[0])
    }
}

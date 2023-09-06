//
//  TicketA.swift
//  CaritasMtyRepartidor
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct TicketA: View {
    var body: some View {
        NavigationStack{
            List(listaTickets){ ticketItem in
                NavigationLink{
                    VistaTicket(ticket: ticketItem)
                }
                label:{
                    TicketRow(ticket: ticketItem)
                }
            }.listStyle(.inset)
        }
    }
}

struct TicketA_Previews: PreviewProvider {
    static var previews: some View {
        TicketA()
    }
}

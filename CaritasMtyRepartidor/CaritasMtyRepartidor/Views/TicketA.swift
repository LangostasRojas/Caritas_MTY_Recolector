//
//  TicketA.swift
//  CaritasMtyRepartidor
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct TicketA: View {
    @State public var listaTicket: Array<Ticket> = callAPILista(userID: 2)
    var body: some View {
        
            ZStack{
                
                NavigationStack{
<<<<<<< Updated upstream
                    List(listaTickets){ ticketItem in
=======
                    List(listaTicket){ ticketItem in
>>>>>>> Stashed changes
                        NavigationLink(destination:VistaTicket(ticket: ticketItem) ){
                            TicketRow(ticket: ticketItem)
                        }.frame(width: 380)

                        
                                            }
                    
                }
            }.background(Color("BgColor"))
       
    }
}

struct TicketA_Previews: PreviewProvider {
    static var previews: some View {
        TicketA()
    }
}

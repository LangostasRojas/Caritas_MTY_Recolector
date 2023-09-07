//
//  TicketA.swift
//  CaritasMtyRepartidor
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct TicketA: View {
    var body: some View {
        
            
            ZStack{
                
                NavigationStack{
                    List(listaTickets){ ticketItem in
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

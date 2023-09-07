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
        ZStack{
                ForEach(listaTickets, id: \.self) { item in
                    ZStack{
                        Color("BgColor")
                        NavigationLink(destination: VistaTicket(ticket: item)) {
                            TicketRow(ticket: item)

                        }
                    }
                                    }.listRowBackground(Color("BgColor"))

                List(listaTickets){ ticketItem in
                    ZStack{
                        Color("BgColor")
                        NavigationLink(destination:VistaTicket(ticket: ticketItem)){
                            TicketRow(ticket: ticketItem)
                            
                        }
                        
                        }
                }.listStyle(.plain)
                            .background(Color("BgColor"))
                            .listRowBackground(Color("BgColor")).scrollContentBackground(.hidden)
                            
            }.background(Color("BgColor"))
        }.background(Color("BgColor"))
        
       
    }
}

struct TicketA_Previews: PreviewProvider {
    static var previews: some View {
        TicketA()
    }
}

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
        ZStack{
            Color("BgColor").ignoresSafeArea()
            HStack{
                
                Image("Mapa").resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                
                VStack(alignment: .leading){
                    Text("\(ticket.nombre)")
                        .font(.title)
                        .foregroundColor(.white)
                    Text("$ \(String(format: "%.2f", ticket.cantidad))")
                        .font(.title)
                        .foregroundColor(.white)
                }
                Spacer()
                
            }.padding()
                .background(Color("BgColor"))
            
        }
    }
    
}

struct JugadorRow_Previews: PreviewProvider {
    static var previews: some View {
        TicketRow(ticket: listaTickets[0])
    }
}

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
                    Color("BgColor").ignoresSafeArea()

                    VStack{
                        HStack{
                            Text("Tickets")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                                .fontWeight(.bold)
                                .padding(.leading, 40.0)
                            Spacer()
                            
                        }
                        .padding(.top, 20.0)
                        Rectangle()
                            .fill(Color("ColorAzulVerdePaleta"))
                            .frame(width: 170,height: 7)
                            .cornerRadius(20)
                            .offset(x:-70,y:-25)
                        ScrollView{
                            LazyVStack(spacing: 10){
                                
                                
                                if let unwrappedListaTicketsR = listaTicketsR {
                                    
                                    
                                    ForEach(unwrappedListaTicketsR) { ticketItem in
                                        NavigationLink(destination: VistaTicket(ticket: ticketItem)) {
                                            
                                            TicketRow(ticket: ticketItem)
                                        }
                                        .buttonStyle(.plain)
                                        .padding(0)
                                        Divider()
                                            .frame(width: 300.0, height: 1.4)
                                            .overlay(Color("ColorAzulVerdePaleta"))
                                    }
                                } else {
                                    Text("No tickets available") 
                                }

                                
                                
                            }
                        }
                    }

                    
                    
//                    List(listaTickets){ ticketItem in
//                        NavigationLink(destination:VistaTicket(ticket: ticketItem) ){
//                            TicketRow(ticket: ticketItem)
//                        }.buttonStyle(.plain)
//                            .padding(0)
//
//                    }.scrollContentBackground(.hidden)
//                        .listStyle(.plain)
//                        .listRowSeparator(.hidden)
//                        .padding(0)
                    
                        
                }
           
        }
            
    }
}

struct TicketA_Previews: PreviewProvider {
    static var previews: some View {
        TicketA()
    }
}

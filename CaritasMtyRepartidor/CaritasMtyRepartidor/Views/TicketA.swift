//
//  TicketA.swift
//  CaritasMtyRepartidor
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct TicketA: View {
    @State var listaTemp: Array<Ticket> = []
    @State private var showingPop = false
    @Environment(\.presentationMode) var presentationMode
    
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
                            Button(action: {
                                self.showingPop = true
                            }){

                                Image(systemName: "rectangle.portrait.and.arrow.forward").font(.system(size: 25)).padding(.trailing, 30.0).foregroundColor(.white).padding(.top,10)

                            }.alert(isPresented: $showingPop) {

                                Alert(title: Text("Cerras sesion"), message: Text("¿Estas seguro de que quieres cerrar sesión?"), primaryButton: .destructive(Text("Si")){

                                    presentationMode.wrappedValue.dismiss()

                                }, secondaryButton: .cancel()

                                )

                            }
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
                                    ForEach(listaTemp) { ticketItem in
                                        NavigationLink(destination: VistaTicket(ticket: ticketItem, statusRoute: ticketItem.estatusVisita,finished:false,selectedComment: 0)) {
                                            
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

                    
                        
                }
           
        }.onAppear(){
            
            if let repartidor = repartidor {
                listaTemp = callTickets(userID: repartidor.userId, token: repartidor.accessToken)

            }
            
        }
            
    }
}

struct TicketA_Previews: PreviewProvider {
    static var previews: some View {
        TicketA()
    }
}

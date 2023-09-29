//
//  VistaTicket.swift
//  CaritasMtyRepartidor
//
//  Created by Alumno on 06/09/23.
//

//
//  VistasDetailed.swift
//  CaritasMty
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct VistaTicket: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var ticket : Ticket
    @State var statusRoute: Int
    @State var finished: Bool
    @State var comentarios: String
    
    var body: some View {
        ZStack{
            Color("BgColor")
                .ignoresSafeArea()
            VStack{
                HStack{
                    Text("Ticket - \(ticket.id)")
                        .foregroundColor(.white)
                        .font(.system(size: 34))
                        .fontWeight(.bold)
                        .padding(.leading, 40.0)
                    Spacer()
                }
               
                    
                Rectangle()
                    .fill(Color("ColorAzulVerdePaleta"))
                    .frame(width: 170,height: 7)
                    .cornerRadius(20)
                    .offset(x:-64,y:-25)
                
                Image("Mapa")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                
                if(!finished){
                    VStack{
                        Group{
                            Text("Nombre: ")
                                .padding(.bottom,5)
                                .fontWeight(.bold)
                            Text(ticket.nombre)
                                .padding(.bottom,5.0)
                            Text("Dirección")
                                .padding(.bottom,5.0)
                                .fontWeight(.bold)
                            Text("Calle Eugenio Garza Sada, Lomas Garza, Boca del Rio, Veracruz, C.P. 95264, Mexico")
                            Text("$ \(String(format: "%.2f", ticket.importe))").bold()
                                .font(.system(size: 36))
                                .padding(.vertical,5)
                        }
                        .font(.system(size: 20))
                        .padding(.horizontal,20.00)
                    }
                    .foregroundColor(.white)
                    
                    if (statusRoute == 0) {
                        Button(action: {
                            if let repartidor = repartidor {
                                markOnRouteTicket(ticketID: ticket.id, token: repartidor.accessToken, estatus: 1) {
                                    (success, error) in
                                    
                                    if(success){
                                        statusRoute = 1
                                    } else{
                                        print("SUPER F no jalo")
                                    }
                                }
                            }
                            
                        }, label: {
                            Text("En Ruta")
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)
                            
                                .frame(width: 280.0, height: 70.0)
                                .background(Color("ColorAzulVerdePaleta"))
                                .cornerRadius(30)
                                .shadow(color:.black,radius: 2,y:2)
                        })
                        .padding(.top, 10)
                    }
                    else {
                        Button(action: {
                            if let repartidor = repartidor {
                                completeTicket(ticketID: ticket.id, token: repartidor.accessToken, estatus: 1) {
                                    (success, error) in
                                    
                                    if(success){
                                        print("EXITOOO!")
                                        if let listat = listaTicketsR{
                                            listaTicketsR?.remove(at: removeItem(arreglo: listat, ticket: ticket))
                                        finished = true
    //                                        self.presentationMode.wrappedValue.dismiss()
                                        }
                                    } else{
                                        print("SUPER F no jalo")
                                    }
                                }
                            }
                        }, label: {
                            Text("Recolectado")
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)
                            
                                .frame(width: 280.0, height: 70.0)
                                .background(Color("ColorAzulVerdePaleta"))
                                .cornerRadius(30)
                                .shadow(color:.black,radius: 2,y:2)
                        })
                        .padding(.top, 10)
                        
                        Button(action: {
                            if let repartidor = repartidor {
                                completeTicket(ticketID: ticket.id, token: repartidor.accessToken, estatus: 2) {
                                    (success, error) in
                                    
                                    if(success){
                                        print("EXITOOO!")
                                        if let listat = listaTicketsR{
                                            listaTicketsR?.remove(at: removeItem(arreglo: listat, ticket: ticket))
                                            finished = true
                                           //self.presentationMode.wrappedValue.dismiss()
                                        }
                                    } else{
                                        print("SUPER F no jalo")
                                    }
                                }
                            }
                        }, label: {
                            Text("No recolectado")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                            
                                .frame(width: 220.0, height: 60.0)
                                .background(Color("ColorAzulVerdeOscuro"))
                                .cornerRadius(30)
                                .shadow(color:.black,radius: 2,y:2)
                        })
                        .padding(.top, 10)
                    }

                }
                else {
                    VStack {
                        Text("Comentarios")
                            .foregroundColor(.white)
                            .font(.system(size: 34))
                            .fontWeight(.bold)
                            .padding(.top,20)
                        
                        TextField("", text: $comentarios, prompt: Text(" Escribe tus comentarios...").foregroundColor(.white).bold(), axis: .vertical)
                            .foregroundColor(.white)
                            .padding()
                        //                        .frame(width: 350, height: 200)
                            .background(.clear)
                            .tint(.white).lineLimit(8...)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color("ColorAzulVerdePaleta"), lineWidth: 3))
                            .autocorrectionDisabled(true).autocapitalization(.none)
                            .padding(.top,10)
                        
                        Button(action: {
//                            if let repartidor = repartidor {
//                                sendComment(ticketID: ticket.id, token: repartidor.accessToken, comment: comentarios) {
//                                    (success, error) in
//
//                                    if(success){
//                                        print("EXITOOO!")
//                                        if let listat = listaTicketsR{
//                                            listaTicketsR?.remove(at: removeItem(arreglo: listat, ticket: ticket))
//                                            finished = true
//                                            self.presentationMode.wrappedValue.dismiss()
//                                        }
//                                    } else{
//                                        print("SUPER F no jalo")
//                                    }
//                                }
//                            }
                        }, label: {
                            Text("Enviar")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                            
                                .frame(width: 220.0, height: 60.0)
                                .background(Color("ColorAzulVerdeOscuro"))
                                .cornerRadius(30)
                                .shadow(color:.black,radius: 2,y:2)
                        })
                        .padding(.top, 10)
                    }
                    .padding(.horizontal, 30.0)
                }
                       
                
            }
        }
    }
}

func removeItem(arreglo: Array<Ticket>, ticket: Ticket) -> Int{
    var i: Int = 0
    while true{
        if arreglo[i].id == ticket.id{
            return i
        }else{
            i+=1
        }
    }
}


struct VistaTicket_Previews: PreviewProvider {
    static var previews: some View {
        
        VistaTicket(ticket: listaTickets[0], statusRoute: listaTickets[0].estatusVisita, finished: false,comentarios: "")
    }
}


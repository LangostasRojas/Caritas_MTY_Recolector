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
import CoreLocation
import CoreLocationUI
import MapKit

struct VistaTicket: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var ticket : Ticket
    @State var statusRoute: Int
    @State var finished: Bool
    @State var selectedComment: Int
    @State var cargarondatos: Bool = false
    @State var localEnd: Location
    
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
                    .offset(x:-64,y:-25).onAppear(){
                        if let repartidor = repartidor{
                            localEnd = callLocation(ticketID: ticket.id, token: repartidor.accessToken)
                            print("Se cargaron los datos de localizacion")
                            cargarondatos = true
                        }
                    }
                

                if(cargarondatos){
                    MiniMapView(coordinatesend: CLLocationCoordinate2D(latitude: localEnd.lat, longitude: localEnd.lng), region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: localEnd.lat, longitude: localEnd.lng), latitudinalMeters: 2000, longitudinalMeters: 2000)).frame(width: 350,height: 200).cornerRadius(10).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("ColorAzulVerdePaleta"), lineWidth: 3))
                }else{
                    ProgressView()
                }
                
                
                // VISTA de un Ruta y Marcar completado/No completado
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
                            Text(ticket.direccion)
                            Text("$ \(String(format: "%.2f", ticket.importe))").bold()
                                .font(.system(size: 36))
                                .padding(.vertical,5)
                        }
                        .font(.system(size: 20))
                        .padding(.horizontal,20.00)
                    }
                    .foregroundColor(.white)
                    
                    // MARCAR EN RUTA
                    if (statusRoute == 0) {
                        Button(action: {
                            if let repartidor = repartidor {
                                markOnRouteTicket(ticketID: ticket.id, token: repartidor.accessToken, estatus: 1) {
                                    (success, error) in
                                    
                                    if(success){
                                        statusRoute = 1
                                    } else{
                                        print("Error \(error)")
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
                        // RECOLECTADO
                        Button(action: {
                            if let repartidor = repartidor {
                                completeTicket(ticketID: ticket.id, token: repartidor.accessToken, estatus: 1) {
                                    (success, error) in
                                    
                                    if(success){
                                        if let listat = listaTicketsR{
                                            listaTicketsR?.remove(at: removeItem(arreglo: listat, ticket: ticket))
                                            finished = true
                                            self.presentationMode.wrappedValue.dismiss()
                                        }
                                    } else{
                                        print("Error \(error)")
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
                        
                        
                        // NO RECOLECTADO
                        Button(action: {
                            if let repartidor = repartidor {
                                completeTicket(ticketID: ticket.id, token: repartidor.accessToken, estatus: 2) {
                                    (success, error) in
                                    
                                    if(success){
                                        finished = true
                                    } else{
                                        print("Error \(error)")
                                    }
                                }
                            }
                        }, label: {
                            Text("No Recolectado")
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)
                                .tint(.white)
                                .background(.clear)
                                .frame(width: 280.0, height: 70.0)
                                .cornerRadius(30)
                                .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color("ColorAzulVerdePaleta"), lineWidth: 3))
                                .shadow(color:.black,radius: 2,y:2)
                        })
                        .padding(.top, 10)
                    }

                }
                // VISTA de comentarios
                else {
                    VStack {
                        Text("Comentarios")
                            .foregroundColor(.white)
                            .font(.system(size: 34))
                            .fontWeight(.bold)
                            .padding(.top,20)
                        
                        Picker(selection: $selectedComment, label: Text("Elegir")) {
                            ForEach(listCommentOptions) {
                                option in
                                Text(option.comment)
                                    .font(.title)
                                    .tag(option.id)
                                    .foregroundColor(.white)
                            }
                        }.pickerStyle(.wheel)
                        
                    
                        Button(action: {
                            if let repartidor = repartidor {
                                sendComment(ticketID: ticket.id, token: repartidor.accessToken, comment: selectedComment) {
                                    (success, error) in
                                    
                                    if(success){
                                        if let listat = listaTicketsR{
                                            listaTicketsR?.remove(at: removeItem(arreglo: listat, ticket: ticket))
                                            finished = true
                                            self.presentationMode.wrappedValue.dismiss()
                                        }
                                    } else{
                                        print("SUPER F no jalo")
                                    }
                                }
                            }
                        }, label: {
                            Text("Enviar")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                            
                                .frame(width: 220.0, height: 60.0)
                                .background(Color("ColorAzulVerdePaleta"))
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
        
        VistaTicket(ticket: listaTickets[0], statusRoute: listaTickets[0].estatusVisita, finished: false, selectedComment: 1, localEnd: Location(lat: 0.0, lng: 0.0))
    }
}


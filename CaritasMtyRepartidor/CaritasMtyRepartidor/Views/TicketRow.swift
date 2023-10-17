//
//  TicketRow.swift
//  CaritasMtyRepartidor
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI
import CoreLocation
import CoreLocationUI
import MapKit

struct TicketRow: View {
    var ticket : Ticket
    @State var cargarondatos: Bool = false
    @State var localEnd: Location
    var body: some View {
        ZStack{
            Color("BgColor").ignoresSafeArea().onAppear(){
                if let repartidor = repartidor{
                    localEnd = callLocation(ticketID: ticket.id, token: repartidor.accessToken)
                    print("Se cargaron los datos de localizacion")
                    cargarondatos = true
                }
            }
            HStack{
                
                if(cargarondatos){
                    MiniMapView(coordinatesend: CLLocationCoordinate2D(latitude: localEnd.lat, longitude: localEnd.lng), region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: localEnd.lat, longitude: localEnd.lng), latitudinalMeters: 20000, longitudinalMeters: 20000)).frame(width: 100, height: 100).cornerRadius(10)
                }else{
                    ProgressView()
                }
                
                VStack(alignment: .leading){
                    Text("\(ticket.nombre)")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.bottom,5)
                        .bold()
                    Text("$ \(String(format: "%.2f", ticket.importe))")
                        .font(.title)
                        .foregroundColor(.white)
                    
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(Color("ColorAzulVerdePaleta"))
                    .padding(.trailing, 15.0)
                    .bold()
                    
                    
                
                
                
                
            }.padding()
                .background(Color("BgColor"))
            
        }
    }
    
}

struct JugadorRow_Previews: PreviewProvider {
    static var previews: some View {
        TicketRow(ticket: listaTickets[0], localEnd: Location(lat: 0.0, lng: 0.0))
    }
}

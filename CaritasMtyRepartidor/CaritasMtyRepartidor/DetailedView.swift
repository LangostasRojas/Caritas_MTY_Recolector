//
//  DetailedView.swift
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

struct DetailedView: View {
    var body: some View {
        ZStack{
            
            Color("BgColor")
                .ignoresSafeArea()
            VStack{
                Text("Ticket - 201342")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                Rectangle()
                    .fill(Color("ColorAzulVerdePaleta"))
                    .frame(width: 170,height: 7)
                    .cornerRadius(20)
                    .offset(x:-60,y:-25)
                Image("Mapa")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)

                    VStack{
                        Group{
                            Text("Nombre: ")
                                .padding(10)
                                .fontWeight(.bold)
                            Text("Kraken Alejandro Dominguez Ramirez")
                                .padding(.bottom,5.0)
                            Text("Dirección")
                                .padding(.bottom,5.0)
                                .fontWeight(.bold)
                            Text("Calle Eugenio Garza Sada, Lomas Garza, Boca del Rio, Veracruz, C.P. 95264, Mexico")
                            Text("Cantidad")
                                .padding(.vertical,5)
                                .fontWeight(.bold)
                            Text("$ 2,000")
                                .padding(.bottom,10)
                        }
                        .font(.system(size: 20))
                        .padding(.horizontal,20.00)
                       
                    }
                    .foregroundColor(.white)

                Button(action: {
                    
                }, label: {
                    Text("Completar Entrega")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                    
                        .frame(width: 280.0, height: 70.0)
                        .background(Color("ColorAzulVerdePaleta"))
                        .cornerRadius(30)
                        .shadow(color:.black,radius: 2,y:2)
                })

            
                
                    
            }
           
            
        }
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView()
    }
}

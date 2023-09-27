import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack{
                Image("Image")
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .ignoresSafeArea()
                Image("logo")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.bottom,400)

                VStack{
                    Button(action: {
                        
                    }, label: {
                        Text("Iniciar Sesión")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.vertical,15)
                            .padding(.horizontal,70)
                            .background(Color("ColorAzulVerdePaleta"))
                            .cornerRadius(50)
                            .shadow(color:.black,radius: 2,y:2)
                    })
                    .padding(.bottom,30)
                    
//                    Button(action: {
//
//                    }, label: {
//                        Text("Registrarse")
//                            .font(.title)
//                            .bold()
//                            .foregroundColor(.white)
//                            .padding(.vertical,15)
//                            .padding(.horizontal,60)
//                            .background(Color("ColorAzulVerdeOscuro"))
//                            .cornerRadius(50)
//                            .shadow(color:.black,radius: 2,y:2)
//                    })
                }
                
                
                    
                    
                    
            }
           
            
        }
        .padding()
        .background(Color("ColorFondo"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

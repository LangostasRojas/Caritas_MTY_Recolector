//
//  LoginView.swift
//  CaritasMty
//
//  Created by Alumno on 04/09/23.
//

import SwiftUI

struct Login: View {

    @State var username: String = ""
    @State var password: String = ""

    @State var boolalerta: Bool = false

    @State var lista: Array<Ticket> = []
    @State var shouldNav: Bool = false
    var body: some View {
        NavigationStack{
            VStack{
                ZStack{
                    Image("Image")
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                    Image("logo")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .padding(.bottom,400)
                    
                    VStack{
                        
                        Spacer().frame(height: 350)
                        
                        TextField("", text: $username, prompt: Text("Ingresa tu usuario").foregroundColor(.white))
                            .padding()
                            .frame(width: 350, height: 55)
                            .background(.clear)
                            .tint(.white)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color("ColorAzulVerdePaleta"), lineWidth: 3))
                            .autocorrectionDisabled(true).autocapitalization(.none)
                        
                        
                        Spacer().frame(height: 50)
                        
                        //                    TextField("Ingresa tu password", text: $password, prompt: Text("Ingresa tu contraseña").foregroundColor(.white))
                        //                        .padding()
                        //                        .frame(width: 350, height: 55)
                        //                        .background(.clear)
                        //                        .tint(.white)
                        //                        .foregroundColor(.white)
                        //                        .cornerRadius(15)
                        //                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color("ColorAzulVerdePaleta"), lineWidth: 3))
                        //                        .autocorrectionDisabled(true)
                        
                        SecureField("Ingresa tu password", text: $password, prompt: Text("Ingresa tu contraseña").foregroundColor(.white))
                            .padding()
                            .frame(width: 350, height: 55)
                            .background(.clear)
                            .tint(.white)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color("ColorAzulVerdePaleta"), lineWidth: 3))
                            .autocorrectionDisabled(true)
                        
                        if boolalerta{
                            ZStack{
                                Rectangle()
                                    .foregroundColor(Color("ColorError"))
                                    .frame(width: 350,height: 40)
                                    .cornerRadius(20)
                                Text("Usuario o contraseña incorrecto").foregroundColor(.white).font(.system(size: 20)).bold().multilineTextAlignment(.center)
                                    
                            }
                        }
                        
                        BotonUni(textoboton: "Iniciar Sesión",colorboton: "ColorAzulVerdePaleta",widthboton: 280, heightboton: 60){

                            login(usernamelog: "\(username)", passwordlog: "\(password)") {
                             (user, error) in
                             if let user = user {
                                 repartidor = user
                                 print(user)
                                
                                 listaTicketsR = callTickets(userID: user.userId, token: user.accessToken)
                                 if let unwrappedListaTicketsR = listaTicketsR {
                                     print(unwrappedListaTicketsR)
                                 } else {
                                     print("listaTicketsR is nil")
                                 }
                                 shouldNav = true
                             } else if let error = error {

                                 print(error)
                                 boolalerta = true
                                 shouldNav = false
                             }
                             }
                        }.background(
                            NavigationLink(destination:
                                            TicketA().navigationBarBackButtonHidden(true), isActive: $shouldNav){
                                
                            }).padding(80)
                        
//                        NavigationLink(destination: TicketA().navigationBarBackButtonHidden(true)){
//                            Text("Inicia Sesión")
//                                .font(.title)
//                                .bold()
//                                .foregroundColor(.white)
//
//                                .frame(width: 280.0, height: 60.0)
//                                .background(Color("ColorAzulVerdePaleta"))
//                                .cornerRadius(30)
//                                .shadow(color:.black,radius: 2,y:2)
//                                .padding(80.0)
//
//                        }
                        
                        /*
                         Button(action: {
                         // 1. Van a llamr su funcion de ModelData que regrese usua y pass
                         //Con lo datos que REGRESA esa funcion van a hacer el if -else
                         // De ahi van a redireccionar
                         
                         /*login(usernamelog: "\(username)", passwordlog: "\(password)") {
                          (user, error) in
                          if let user = user {
                          TicketA()
                          print("Logged in user: \(user.userName)")
                          } else if let error = error {
                          TicketA()
                          print("Error logging in: \(error.localizedDescription)")
                          }
                          }*/
                         }, label: {
                         Text("Iniciar Sesión")
                         .font(.title)
                         .bold()
                         .foregroundColor(.white)
                         
                         .frame(width: 280.0, height: 60.0)
                         .background(Color("ColorAzulVerdePaleta"))
                         .cornerRadius(30)
                         .shadow(color:.black,radius: 2,y:2)
                         })
                         .padding(80) */
                    }
                }
            }
            
        }
    }
}

func isValidEmail(_ email: String) -> Bool {
    // Regular expression pattern for a simple email validation
    let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
    
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    return emailPredicate.evaluate(with: email)
}
                        
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

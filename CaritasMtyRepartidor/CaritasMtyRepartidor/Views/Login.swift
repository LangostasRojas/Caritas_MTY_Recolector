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
                        
                        TextField("", text: $username, prompt: Text("Ingresa tu email").foregroundColor(.white))
                            .padding()
                            .frame(width: 350, height: 55)
                            .background(.clear)
                            .tint(.white)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color("ColorAzulVerdePaleta"), lineWidth: 3))
                            .autocorrectionDisabled(true)
                        
                        
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
                        
                        NavigationLink(destination: TicketA().navigationBarBackButtonHidden(true)){
                            Text("inicia sesion")
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)
                                
                                .frame(width: 280.0, height: 60.0)
                                .background(Color("ColorAzulVerdePaleta"))
                                .cornerRadius(30)
                                .shadow(color:.black,radius: 2,y:2)
                                .padding(80.0)
                            
                        }
                        
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

//
//  BotonUni.swift
//  CaritasMty
//
//  Created by Alumno on 05/09/23.
//

import SwiftUI

struct BotonUni: View {
    var textoboton : String = ""
    var colorboton : String = "ColorAzulVerdePaleta"
    var widthboton : Double = 0.0
    var heightboton : Double = 0.0
    
    var body: some View {
        Button(action: {
            
        }, label: {
            Text("\(textoboton)")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
                .frame(width: 280.0, height: 60.0)
                .background(Color("\(colorboton)"))
                .cornerRadius(30)
                .shadow(color:.black,radius: 2,y:2)
        })
    
    }
}

struct BotonUni_Previews: PreviewProvider {
    static var previews: some View {
        BotonUni()
    }
}

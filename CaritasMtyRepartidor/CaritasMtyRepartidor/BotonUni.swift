//
//  BotonUni.swift
//  CaritasMty
//
//  Created by Alumno on 05/09/23.
//

import SwiftUI

struct BotonUni: View {
    var textoboton : String = ""
    var colorboton : String = ""
    var widthboton : Double = 0.0
    var heightboton : Double = 0.0
    var actionbutton : () -> Void
    var body: some View {
        Button(action: actionbutton, label: {
            Text("\(textoboton)")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
                .frame(width: widthboton, height: heightboton)
                .background(Color("\(colorboton)"))
                .cornerRadius(30)
                .shadow(color:.black,radius: 2,y:2)
        })
    
    }
}

//struct BotonUni_Previews: PreviewProvider {
//    static var previews: some View {
//        BotonUni()
//    }
//}

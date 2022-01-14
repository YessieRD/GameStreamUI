//
//  JuegosView.swift
//  GameStream
//
//  Created by Yessie Rodriguez on 14/1/22.
//

import SwiftUI

struct JuegosView: View {
    var body: some View {
        Text("Hola desde JuegosView")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(perform: {
                
                print("Primer Elemento del Json")
                
                print("titulo del Primer juego del Json")
                
            } )
    }
}

struct JuegosView_Previews: PreviewProvider {
    static var previews: some View {
        JuegosView()
    }
}

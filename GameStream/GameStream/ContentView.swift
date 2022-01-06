//
//  ContentView.swift
//  GameStream
//
//  Created by Yessie Rodriguez on 6/1/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        ZStack {
            
            Spacer()
            
            Color(red: 19/255, green: 29/255, blue: 53/255, opacity: 1.0).ignoresSafeArea()
            
            VStack{
                
                Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 42)
                
                
                InicioYRegistroView()
                
                
            }
        }
    }
}



struct InicioYRegistroView:View {
    
    @State var tipoInicioSesion = true
    
    var body: some View{
        
        VStack{
            
            HStack{
                
                
                Spacer()
                
                Button("INICIA SESIÓN") {
                tipoInicioSesion = true
                    
                    print("Pantalla Inicio Sesion")
                }
                .foregroundColor(tipoInicioSesion ? .white : .gray)
                
                Spacer()
                
                 Button("REGÍSTRATE") {
                     tipoInicioSesion = false

                  print("Pantalla de Registro")
                  }
                 .foregroundColor(tipoInicioSesion ? .gray : .white)

                  
                Spacer()
            }
            
            
            Spacer(minLength: 42)
            
            
            if tipoInicioSesion == true{
                
                InicioSesionView()
            }else{
                
                RegistroView()
                
            }
    }
}
}
 

struct InicioSesionView:View {
    var body: some View{
        
     
        ScrollView {
            
            VStack(alignment:.leading) {
                
                Text("Correo electrónico").foregroundColor(Color("Dark-Cian"))
                
                
                ZStack{
                    
                    Text("ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                    
                }
                
                
            }.padding(.horizontal, 77.0)
        }
        
        
        
    }
}


struct RegistroView:View {
    var body: some View{
        
     
        Text("Registro")
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        Image("pantalla1").resizable()
    }
}

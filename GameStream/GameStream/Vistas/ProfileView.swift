//
//  ProfileView.swift
//  GameStream
//
//  Created by Yessie Rodriguez on 21/4/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var nombreUsuario = "Lorem"
    
    var body: some View {
        
        ZStack{
            
            Color("Marine").ignoresSafeArea()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            
            
            VStack{
                
                Text("Perfil")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity,
                           alignment: .center)
                    .padding()
                
                VStack{
                    
                    Image("perfilejemplo").resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 118.0, height: 118.0)
                        .clipShape(Circle())
                    
                }.padding(EdgeInsets(top: 16, leading: 0,
                                     bottom: 32, trailing: 0))
                
                
                Text("Ajustes")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity,
                           alignment: .leading)
                    .padding(.leading,18)
        
            ModuloAjustes()
            
        }.onAppear(
        
            perform: {
                
            print("Resisando si tengo Datos de usuario en user default")
            }
        )
        
        
        
        
        
        
        
    }
}
}


struct ModuloAjustes: View{
    var body: some View{
        
        Text("Hola")
    }
    
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

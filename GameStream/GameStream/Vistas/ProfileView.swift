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
                
                
                VStack{
                    
                Text("Perfil")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity,
                           alignment: .center)
                    .padding()
                
                    
                    Image("perfilejemplo").resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 118.0, height: 118.0)
                        .clipShape(Circle())
                    
                }.padding(EdgeInsets(top: 16, leading: 0,
                                     bottom: 32, trailing: 0))
                
                
                Text("Ajustes")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity,
                           alignment: .leading)
                    .padding(.leading,17)
        
            ModuloAjustes()
                Spacer()
            
        }.onAppear(
        
            perform: {
                
            print("Resisando si tengo Datos de usuario en user default")
            }
        )
        
        
            
        
        
        
    }
}
}


struct ModuloAjustes: View{
    
    @State var isToggleOn = true
    @State var isEditProfileViewActive = false
    
    var body: some View{
        
        
        VStack(spacing: 3){
            
            Button(action: {}, label: {
                
                HStack{
                    Text("Cuenta")
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text(">").foregroundColor(.white)
                    
                }.padding()
            }).background(Color("Blue-Gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1.0))
                
        
            
            Button(action: {}, label: {
                
            
                HStack{
                    Text("Notificaciones")
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                    Toggle("", isOn: $isToggleOn).foregroundColor(.white)
                    
                }.padding()
            }).background(Color("Blue-Gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            
            Button(action: {
                isEditProfileViewActive = true},
                   label: {
                HStack{
                    Text("Editar Perfil")
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text(">").foregroundColor(.white)
                    
                }.padding()
            }).background(Color("Blue-Gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1.0))
                
            Button(action: {}, label: {
                
                
                HStack{
                    Text("Califica esta aplicación")
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text(">").foregroundColor(.white)
                    
                }.padding()
            }).background(Color("Blue-Gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            
            NavigationLink(
                            destination: EditProfileView(),
                            isActive: $isEditProfileViewActive,
                            label: {
                                EmptyView()
                            })
    
        }
        
    }
    
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

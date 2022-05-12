//
//  ProfileView.swift
//  GameStream
//
//  Created by Yessie Rodriguez on 21/4/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var nombreUsuario = "Lorem"
    @State var imagenPerfil: UIImage = UIImage(named: "perfilejemplo")!
    
    var body: some View {
        
        ZStack{
            
            Color("Marine").ignoresSafeArea()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            
            
            VStack{
                
                Text("Perfil").font(.title2)
                .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity,
                   alignment: .center)
            .padding()
                
                VStack{
                    
                    
                    
                
                    
                    Image(uiImage: imagenPerfil).resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 118.0, height: 118.0)
                        .clipShape(Circle())
                    
                    Text(nombreUsuario)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
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
                
                
                if returnUiImage(named: "fotoperfil") != nil{
                    
                    imagenPerfil = returnUiImage(named: "fotoperfil")!
                }else{
                    
                    print("No encontre foto de perfil guardada en el dispositivo")
                }
                
                
                
                
            print("Revisando si tengo Datos de usuario en user default")
                
                if UserDefaults.standard.object(forKey: "datosUsuario") != nil {
                    
                    nombreUsuario =
                    UserDefaults.standard.stringArray(forKey: "datosUsuario")! [2]
                }else{
                    
                    print("No encontre información del usuario")
            
                }
            }
        
        
        )
        
        
            
        
        
        
    }
}
    
    func returnUiImage(named:String) -> UIImage? {
        
        
        if let dir = try? FileManager.default.url(for: .documentDirectory,
                                                  in: .userDomainMask,
                                                  appropriateFor: nil,
                                                  create: false){
            
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString)
                .appendingPathComponent(named).path)
        
    }
        return nil
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

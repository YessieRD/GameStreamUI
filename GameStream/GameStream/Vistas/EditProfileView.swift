//
//  EditProfileView.swift
//  GameStream
//
//  Created by Yessie Rodriguez on 4/5/22.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        
        ZStack{
            
            Color("Marine").ignoresSafeArea()
            
            ScrollView{
                
                VStack(alignment: .center){
                    
                    Button(action: {}, label: {
                        
                        ZStack{
                            
                        Image("perfilejemplo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 118.0, height: 118.0)
                            .clipShape(Circle())
                            
                            Image(systemName: "camera")
                                .foregroundColor(.white)
                            
                        }
                    })
                    
                }.padding(.bottom, 18)
                
                ModuloEditar()
            }
        }
        
    }

}



struct ModuloEditar: View {
    
    @State var correo: String = ""
    @State var contraseña: String = ""
    @State var nombre: String = ""

    
     var body: some View {
        
        
         VStack(alignment: .leading) {
          
             
            Text("Correo electrónico").foregroundColor(Color("Dark-Cian"))



                 ZStack(alignment: .leading){

                      if correo.isEmpty {
                          Text(verbatim: "ejemplo@gmail.com")
                              .font(.caption)
                              .foregroundColor(Color(red: 174/255, green: 177/255,
                                                     blue: 185/255, opacity: 1.0)) }
                             // .foregroundColor(.gray)

                     TextField("", text: $correo)
                         .foregroundColor(.white)
                                 }

                 Divider()
                     .frame(height: 1)
                     .background(Color("Dark-Cian"))
                     .padding(.bottom)


                 Text("Contraseña")
                         .foregroundColor(Color(.white))


                 ZStack(alignment: .leading){

                      if contraseña.isEmpty {
                          Text("Introduce tu nueva contraseña")
                              .font(.caption)
                              .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                             // .foregroundColor(.gray)
                         }

                     SecureField("", text: $contraseña)
                         .foregroundColor(.white)
                 }

                     Divider()
                         .frame(height: 1)
                         .background(Color(.white))
                         .padding(.bottom)

             Text("Nombre")
                     .foregroundColor(Color(.white))


             ZStack(alignment: .leading){

                  if nombre.isEmpty {
                      Text("Introduce tu nombre de usuario")
                          .font(.caption)
                          .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0)) }
                         // .foregroundColor(.gray)

                 TextField("", text: $nombre)
                     .foregroundColor(.white)
                             }

             Divider()
                 .frame(height: 1)
                 .background(Color(.white))
                 .padding(.bottom, 32)

                

             Button(action: {actualizarDatos()}, label: {

                     Text("ACTUALIZAR DATOS")
                         .fontWeight(.bold)
                         .foregroundColor(.white)
                         .frame(maxWidth: .infinity, alignment: .center)
                         .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                         .overlay(RoundedRectangle(cornerRadius: 6.0)
                         .stroke(Color("Dark-Cian"),lineWidth: 1.0)
                         .shadow(color: .white, radius: 3))
                 }).padding(.horizontal, 10.0 )


         }.padding(.horizontal, 30.0 )
         
         
}
 
    func actualizarDatos() {
        
        let objetoActualizadorDatos = SaveData()
        
        let resultado = objetoActualizadorDatos
            .guardarDatos(correo: correo, contraseña: contraseña, nombre: nombre)
        
    print("se guardandolos datos con exito? \(resultado)")
    }
}




struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}

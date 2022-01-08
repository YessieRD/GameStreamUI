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
                
                Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 240).padding(EdgeInsets(top: 20.0, leading: 0.0, bottom: 43.0, trailing: 0.0))
                
                
                InicioYRegistroView()
                
                
            }
        }
    }
}



struct InicioYRegistroView:View {
    
    @State var tipoInicioSesion:Bool = true
    
    var body: some View{
        
        VStack{
            
            HStack{
               //Spacer()
                
                Button("INICIA SESIÓN") {
                tipoInicioSesion = true
                    print("Pantalla Inicio Sesion")
                }
                .foregroundColor(tipoInicioSesion ? .white : .gray).font(.title3)
                
                Spacer()
                
                 Button("REGÍSTRATE") {
                     tipoInicioSesion = false

                  print("Pantalla de Registro")
                  }
                 .foregroundColor(tipoInicioSesion ? .gray : .white).font(.title3)

                  
               // Spacer()
            } .padding(.horizontal, 30)
            
            
           // Spacer(minLength: 63) - asignado a IniciaSesion y Registrate respectivamente
            
            
            if tipoInicioSesion == true{
                
                InicioSesionView()
            }else{
                
                RegistroView()
                
            }
    }
}
}
 

struct InicioSesionView: View {
    
    @State var correo: String = ""
    @State var contraseña: String = ""

    
    var body: some View {
        
        Spacer(minLength: 63)

     
        ScrollView {
            
            VStack(alignment: .leading) {
                
                Text("Correo electrónico").foregroundColor(Color("Dark-Cian"))
                
                
                ZStack(alignment: .leading){
                    
                     if correo.isEmpty {
                         Text("ejemplo@"+"gmail.com").font(.caption).foregroundColor(.gray)
                     
                        }
                    
                    TextField("", text: $correo)
                    
                    
                }
                
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom, 26.0)
                
                


                Text("Contraseña").foregroundColor(Color("Dark-Cian"))
               

                ZStack(alignment: .leading){
                    
                     if contraseña.isEmpty {
                         Text("Escribe tu Contraseña").font(.caption).foregroundColor(.gray)
                     
                        }
            
                  SecureField("", text: $contraseña)
            
                }
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom, 1)

                
                Text("Olvidaste tu contraseña?").font(.footnote).frame(width: 320, alignment: .trailing).foregroundColor(Color("Dark-Cian")).padding(.bottom, 30)

                
                Button(action: iniciarSesion, label: {
                    Text("INICIAR SESIÓN").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"),lineWidth: 1.0).shadow(color: .white, radius: 6))
                })
                
                
                IniciarSesionRedes()
             
                
                
            }.padding(.horizontal, 30.0)
        } //End Scroll view
        
        
        
    }
} //End of InicioSesionView


func iniciarSesion() {
    print("estoy iniciando sesion")
}

func iniciarSesionFacebook() {
    print("estoy iniciando sesion con Facebook")

}

func iniciarSesionTwitter(){
    print("estoy iniciando sesion con Twitter")

}


struct RegistroView:View {
    
    @State var correo = ""
    @State var contraseña = ""
    
    var body: some View{
        
        Spacer(minLength: 43)

        ScrollView {
                        
        VStack(alignment:.center){
            
            Text("Elije una foto de perfil").fontWeight(.bold).foregroundColor(.white).padding(.bottom, -1.0 )
            
            Text("Puedes cambiar o elegirla mas adelante").font(.footnote).fontWeight(.light).foregroundColor(.gray).padding(.bottom)
            
            Button(action: tomarFoto, label: {
                
                ZStack {
                    Image("perfilejemplo")
                    
                    Image(systemName: "camera").foregroundColor(.white).padding(.bottom, -5.0)
                }
                
            })
        
            
        }.padding(.bottom, 3.0)
        
    
            
            VStack(alignment: .leading) {
                Spacer(minLength: 33)

                Text("Correo electrónico*").foregroundColor(Color("Dark-Cian"))
                
                
                ZStack(alignment: .leading){
                    
                     if correo.isEmpty {
                         Text("ejemplo@"+"gmail.com").font(.caption).foregroundColor(.gray)
                     
                        }
                    
                    TextField("", text: $correo)
                    
                    
                }
                
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                
                


                Text("Contraseña*").foregroundColor(Color("Dark-Cian"))
               

                ZStack(alignment: .leading){
                    
                     if contraseña.isEmpty {
                         Text("Escribe tu Contraseña").font(.caption).foregroundColor(.gray)
                     
                        }
            
                  SecureField("", text: $contraseña)
            
                }
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom, 30)

                
        
                Button(action: registrate, label: {
                    Text("REGÍSTRATE").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"),lineWidth: 1.0).shadow(color: .white, radius: 6))
                })
                
                
              IniciarSesionRedes()
                
              
          
                
            }.padding(.horizontal, 30.0 )
    }
        
    }

}
func tomarFoto() {
}

func registrate() {
    print("te registraste")
}


struct IniciarSesionRedes: View {
    var body: some View {
    
        VStack{
            
            Text("Regístrate con redes sociales").foregroundColor(.white).frame(width: 300, height: 50, alignment: .center).padding(.top, 38)
        
        HStack {
            Button(action: iniciarSesionFacebook, label: {
                Text("Facebook").font(.subheadline).fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity,alignment: .center).padding(EdgeInsets(top: 9, leading: 35, bottom: 9, trailing: 35)).background(Color(red: 33/255, green: 48/255, blue: 79/255, opacity: 1.0)).clipShape(RoundedRectangle(cornerRadius: 4.0))
        
            }).padding(3)
            
            Button(action: iniciarSesionTwitter, label: {
                Text("Twitter").font(.subheadline).fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity,alignment: .center).padding(EdgeInsets(top: 9, leading: 35, bottom: 9, trailing: 35)).background(Color(red: 33/255, green: 48/255, blue: 79/255, opacity: 1.0)).clipShape(RoundedRectangle(cornerRadius: 4.0))
                
            }).padding(3)
            
        }
    
        }
        }
}
struct emailPass: View{
    
    @State var correo: String = ""
    @State var contraseña: String = ""

    var body: some View{
    
        VStack{
            
            Text("Correo electrónico").foregroundColor(Color("Dark-Cian"))
            
            
            ZStack(alignment: .leading){
                
                 if correo.isEmpty {
                     Text("ejemplo@"+"gmail.com").font(.caption).foregroundColor(.gray)
                 
                    }
                
                TextField("", text: $correo)
                
                
            }
            
            Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom, 26.0)
            
            


            Text("Contraseña").foregroundColor(Color("Dark-Cian"))
           

            ZStack(alignment: .leading){
                
                 if contraseña.isEmpty {
                     Text("Escribe tu Contraseña").font(.caption).foregroundColor(.gray)
                 
                    }
        
              SecureField("", text: $contraseña)
        
            }
            Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom, 1)
        }
}
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        Image("pantalla2").resizable()
    }
}

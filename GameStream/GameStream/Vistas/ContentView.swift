//
//  ContentView.swift
//  GameStream
//
//  Created by Yessie Rodriguez on 6/1/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                                
                Color(red: 19/255, green: 29/255, blue: 53/255, opacity: 1.0).ignoresSafeArea()
                
                VStack{
                    
                  //  Spacer() //comp added
                    
                    Image("appLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .padding(.bottom, 50.0)
                        .padding(.top, 15)

                InicioYRegistroView()
          
                    
                //DEBUG
//                    Button("Home"){
//                        isHomeActive = true
//                    }
//
//                    NavigationLink(
//                        destination: Home(),
//                        isActive: $isHomeActive,
//                        label:{ EmptyView()
//
//                        })
                    
                    
                }
                
                
            }.navigationBarHidden(true)
        }
    }
}

//Pantalla 1

struct InicioYRegistroView:View {

    @State var tipoInicioSesion:Bool = true

    var body: some View{

        VStack{

            HStack{

                Button("INICIA SESIÓN") {
                tipoInicioSesion = true
                    print("Pantalla Inicio Sesion")
                }
                .foregroundColor(tipoInicioSesion ? .white : .gray)
                .font(.title3)

                Spacer() //middle

                 Button("REGÍSTRATE") {
                     tipoInicioSesion = false

                  print("Pantalla de Registro")
                  }
                 .foregroundColor(tipoInicioSesion ? .gray : .white)
                 .font(.title3)


            } .padding(.horizontal, 30)


            if tipoInicioSesion == true {
                InicioSesionView()
            }else{
                RegistroView()
            }
    }
}
}



struct InicioSesionView: View {

    @State var isHomeActive:Bool = false
    @State var correo:String = ""
    @State var contraseña:String = ""


    var body: some View {

        Spacer(minLength: 63)

        ScrollView {

            VStack{

                VStack(alignment: .leading){

                Text("Correo electrónico")
                    .foregroundColor(Color("Dark-Cian"))


                ZStack(alignment: .leading){

                     if correo.isEmpty {
                         Text("ejemplo@"+"gmail.com")
                             .font(.caption)
                             .foregroundColor(.gray)

                        }

                    TextField("", text: $correo)
                        .foregroundColor(.white)
                }

                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom, 26.0)



                Text("Contraseña").foregroundColor(Color("Dark-Cian"))


                ZStack(alignment: .leading){

                     if contraseña.isEmpty {
                         Text("Introduce tu Contraseña")
                             .font(.caption)
                             .foregroundColor(.gray)

                     }
                    SecureField("", text: $contraseña)
                    .foregroundColor(.white)

                        }

                Divider().frame(height: 1)
                .background(Color("Dark-Cian"))
                .padding(.bottom, 5)
                }


                Text("Olvidaste tu contraseña?")
                    .font(.footnote)
                  .frame(width: 340, alignment: .trailing)
                    .foregroundColor(Color("Dark-Cian"))
                    .padding(.bottom, 65)


                Button(action: iniciarSesion, label: {
                    Text("INICIAR SESIÓN")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"),lineWidth: 1.0)
                                    .shadow(color: .white, radius: 6))

                }).padding(10.0) //added comp




                Text("Inicia sesión con redes sociales")
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50, alignment: .center)
                    .padding(.top, 36)
                    .foregroundColor(.white)
                    .frame(width: 350, height: 50, alignment: .center)


                HStack {

                    Button(action: iniciarSesionFacebook, label: {
                        Text("Facebook")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 9, leading: 35, bottom: 9, trailing: 35))
                            .frame(maxWidth: .infinity,alignment: .center)
                            .background(Color("Blue-Bar"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))

                    }).padding(3)

                    Button(action: iniciarSesionTwitter, label: {
                        Text("Twitter")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity,alignment: .center)
                            .padding(EdgeInsets(top: 9, leading: 35, bottom: 9, trailing: 35))
                            .background(Color("Blue-Bar"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))

                    }).padding(3)

                }.padding(10.0)


               } .padding(.horizontal, 30.0)


                NavigationLink(
                    destination: Home(),
                    isActive: $isHomeActive,
                    label:{ EmptyView()

                })
        }//End Scroll view
        }


    func iniciarSesion() {
        print("Estoy iniciando sesion")

        isHomeActive = true
    }

}


// Pantalla 2

struct RegistroView:View {

    @State var correo:String = ""
    @State var contraseña:String = ""
    @State var confirmacionContraseña:String = ""

    var body: some View{

       Spacer(minLength: 32)

        ScrollView {

            VStack{

        VStack(alignment:.center){

            Text("Elije una foto de perfil")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.bottom, -1.0 )

            Text("Puedes cambiar o elegirla mas adelante")
                .font(.footnote)
                .fontWeight(.light)
                .foregroundColor(.gray)
                .padding(.bottom)

            Button(action: tomarFoto, label: {

                ZStack {
                    Image("perfilejemplo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80.0, height: 80.0)

                    Image(systemName: "camera")
                        .foregroundColor(.white)
                        //.padding(.bottom, -5.0)
                }

            })


        }.padding(.bottom, 3.0)



            VStack(alignment: .leading) {

                Text("Correo electrónico*")
                        .foregroundColor(Color("Dark-Cian"))


                ZStack(alignment: .leading){

                     if correo.isEmpty {
                         Text("ejemplo@"+"gmail.com")
                             .font(.caption)
                             .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0)) }
                            // .foregroundColor(.gray)

                    TextField("", text: $correo)
                        .foregroundColor(.white)
                                }

                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)



                Text("Contraseña*")
                        .foregroundColor(Color("Dark-Cian"))


                ZStack(alignment: .leading){

                     if contraseña.isEmpty {
                         Text("Introduce tu Contraseña")
                             .font(.caption)
                             .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                            // .foregroundColor(.gray)
                        }

                    SecureField("", text: $contraseña)
                        .foregroundColor(.white)
                }

                    Divider()
                        .frame(height: 1)
                        .background(Color("Dark-Cian"))
                        .padding(.bottom)



                Text("Confirmar Contraseña*")
                        .foregroundColor(Color("Dark-Cian"))


                ZStack(alignment: .leading){

                     if confirmacionContraseña.isEmpty {
                         Text("Reintroduce tu Contraseña")
                             .font(.caption)
                             .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                             //.foregroundColor(.gray)
                        }

                    SecureField("", text: $confirmacionContraseña)
                        .foregroundColor(.white)
                }

                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom, 30)
                }


                Button(action: registrate, label: {

                    Text("REGÍSTRATE")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0)
                        .stroke(Color("Dark-Cian"),lineWidth: 1.0)
                        .shadow(color: .white, radius: 6))
                }).padding(.horizontal, 10.0 )


                Text("Regístrate con redes sociales")
                    .foregroundColor(.white)
                    .frame(width: 350, height: 50, alignment: .center)
                    //.padding(.top, 38)

            HStack {

                Button(action: iniciarSesionFacebook, label: {
                    Text("Facebook")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 9, leading: 35, bottom: 9, trailing: 35))
                        .frame(maxWidth: .infinity,alignment: .center)
                        .background(Color("Blue-Bar"))
                        .clipShape(RoundedRectangle(cornerRadius: 4.0))

                }).padding(10.0)

                Button(action: iniciarSesionTwitter, label: {
                    Text("Twitter")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,alignment: .center)
                        .padding(EdgeInsets(top: 9, leading: 35, bottom: 9, trailing: 35))
                        .background(Color("Blue-Bar"))
                        .clipShape(RoundedRectangle(cornerRadius: 4.0))

                }).padding(3)

            }



            } .padding(.horizontal, 30.0 )

        }// EndScroolView



    }
}


func iniciarSesionFacebook() {
 print("estoy iniciando sesion con Facebook")

}

func iniciarSesionTwitter(){
 print("estoy iniciando sesion con Twitter")

}

func tomarFoto() {
     print("Tomo foto")
     //logica de tomar fotos.
 }

 func registrate() {
     print("Me registro con el correo ")
 }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
            ContentView()
        
    }
}
        
       

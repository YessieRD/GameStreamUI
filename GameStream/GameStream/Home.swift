//
//  Home.swift
//  GameStream
//
//  Created by Yessie Rodriguez on 10/1/22.
//

import SwiftUI
import AVKit

struct Home: View {
    
    @State var tabSeleccionado: Int = 2
    
    
    
    var body: some View {
        
        
        
        
        TabView(selection: $tabSeleccionado){
            
            Text("Perfil").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                Image(systemName: "person")
                    Text("Perfil")
            
                }.tag(0)
            
            
            Text("Pantalla Juegos").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                Image(systemName: "gamecontroller")
                    Text("Juegos")
            
                }.tag(1)
            
            
            
            
           PantallaHome()
            
            
                .tabItem {
                Image(systemName: "house")
                    Text("Inicio")
            }.tag(2)
            
            
            Text("Pantalla Favoritos").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                Image(systemName: "heart")
                    Text("Favoritos")
                    
                }.tag(3)
            
                      
        }.accentColor(.white)



        
        
    }
    
    
    
  init(){
        
  
       UITabBar.appearance().backgroundColor = UIColor(Color("tabBarColor"))
      UITabBar.appearance().unselectedItemTintColor = UIColor(Color("aluminium"))
    UITabBar.appearance().isTranslucent = true
    
                print("Iniciando las vistas de home")
                
            }
    
    
}


struct PantallaHome: View{
    
    @State var textoBusqueda = ""
    
    var body: some View{
        
        ZStack {
            
            Color("Marine").ignoresSafeArea()
            
            
            VStack {
                
                Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.horizontal, 11.0)
                
                
                
                VStack {
                    HStack{
                    
                        Button(action: busqueda, label: {
                            
                            Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? Color(.yellow) : Color("Dark-Cian")
                            
                            
                            )
                            
                        })
                        
                        ZStack(alignment: .leading){
                            
                            if textoBusqueda.isEmpty{
                                
                                Text("Buscar un video").foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                                
                            }
                            
                            TextField("", text: $textoBusqueda).foregroundColor(.white)
                            
                        }
                        
                        
                        
                    }.padding([.top,.leading,.bottom], 11.0).background(Color("Blue-Bar")).clipShape(Capsule())
                
                
                    SubModuloHome()

                }
                
                
            }.padding(.horizontal, 18)
            
            
            
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
        

    }
    
    
    
    func busqueda(){
        print("El usuario esta buscando \(textoBusqueda)")
    }
    
    

}


struct SubModuloHome: View {
    
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    
    @State var isPlayerActive = false
    
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body: some View{
        
        
        
        
        VStack {
            Text("LOS M??S POPULARES").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity , alignment: .leading).padding(.top)
            
    
            ZStack{
                
                
                Button(action: {
                    url = urlVideos[0]
                    print("URL: \(url)")
                    isPlayerActive = true
                }, label: {
                    
                     
                    VStack(spacing: 0){
                        
                        Image("The Witcher 3").resizable().scaledToFit()
                        
                        Text("The Witcher 3").frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading).background(Color("Blue-Bar"))
                    }
                    
                })
                
                
                Image(systemName: "play.circle.fill").resizable().foregroundColor(.white).frame(width: 43, height: 42)
                
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.vertical)
            
            
            
            
            
            
        
        }
        
        
        NavigationLink(
            destination: VideoPlayer(player: AVPlayer(url: URL(string: url)!)).frame(width: 400, height: 300)
              ,
            isActive: $isPlayerActive,
            label: {
                EmptyView()
        
            })
        
        
        
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

//
//  GameView.swift
//  GameStream
//
//  Created by Yessie Rodriguez on 25/1/22.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameView: View {
    
    
    var url:String
    var titulo:String
    var studio:String
    var calificacion:String
    var anoPublicacion:String
    var descripcion:String
    var tags:[String]
    var imgsUrl:[String]
    
    var body: some View {
        
        
        ZStack {
            
          Color("Marine").ignoresSafeArea()
            
            VStack{
 
                video(url: url).frame(height: 300)
          
            ScrollView{

                    //Info video
                
             videoInfo (titulo:titulo,studio:studio,calificacion:calificacion,anoPublicacion:anoPublicacion,descripcion:descripcion,tags:tags)
                    .padding(.bottom)
                
                Gallery(imgsUrl:imgsUrl)
                                                
            }.frame(maxWidth: .infinity).ignoresSafeArea()
            //.edgesIgnoringSafeArea(.all)
        }
        }
    }
}

struct video:View{
    
    var url: String
    
    var body: some View{
        
        VideoPlayer(player: AVPlayer(url: URL(string:url)!)).ignoresSafeArea()

        
    }
}


struct videoInfo:View{
    
    @State var isGameSaved = false
    var titulo:String
    var studio:String
    var calificacion:String
    var anoPublicacion:String
    var descripcion:String
    var tags:[String]
    
    var body: some View{
        
    
        VStack(alignment: .leading){
            
            HStack {

            Text("\(titulo)")
            .foregroundColor(.white)
            .font(.largeTitle)
            .bold()
            .padding(.leading)
                Spacer()
                               
Button(action: {
 isGameSaved = true}, label: {
  Image(systemName: "heart.fill").resizable().aspectRatio(contentMode: .fit).frame(width: 18, height: 18).foregroundColor(.white).padding()
 }).alert(isPresented: $isGameSaved) {
    Alert(title: Text("Guardado"), message: Text("El juego \(titulo) se guardo exitosamente"), dismissButton: .default(Text("Entendido")))
      }
                               
                               
                           }
            HStack{
                Text("\(studio)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top,5)
                .padding(.leading)
                
                Text("\(calificacion)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top,5)
                .padding(.leading)
                
                Text("\(anoPublicacion)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top,5)
                .padding(.leading)
            }
                
            Text("\(descripcion)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top,5)
                .padding(.leading)
            
                HStack{
                    
                    ForEach(tags, id:\.self){
                        
                        tag in
                        
                        Text("#\(tag)")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .padding(.top,4)
                            .padding(.leading)
                    }
                    
                }
                
            
        }.frame(maxWidth: .infinity, alignment: .leading).padding(.trailing, 11)
        
    }
}



struct Gallery: View{
    
    var imgsUrl: [String]
    
    let formaGrid = [
    
        GridItem(.flexible())]
    
    var body: some View{
        
        VStack(alignment: .leading){

        Text("GALERÍA")
            .font(.title3)
            .foregroundColor(.white)
            .bold()
            .padding(.leading)
            .padding(.top)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal){
                
                LazyHGrid(rows: formaGrid, spacing:8){
                    
                    ForEach(imgsUrl, id: \.self){
                        
                        imgUrl in
                        
                        KFImage(URL(string: imgUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                    }
                    
                    
                }
                
            }.frame(height: 180)
            

        
    }
    
}
}

struct Comentario: View{

    var body: some View{
        
        
       
        Text("COMENTARIOS")
            .font(.title3)
            .foregroundColor(.white)
            .bold()
            .padding(.leading)
            .padding(.top)
            .frame(maxWidth: .infinity, alignment: .leading)
        
        VStack(alignment: .leading){

            //clipshape
            
            VStack(alignment: .leading) {
                        

                           HStack {
                               // Foto
                               Image("geoff")
                                   .resizable()
                                   .aspectRatio(contentMode: .fit)
                                   .frame(width: 50, height: 50)
                                   .padding(.leading, 14)
                                   .padding(.top,1)



                               VStack
                               {
                                   // Nombre usuario
                                   Text("Geoff Atto").foregroundColor(.white).font(.title3)
                                       .frame(maxWidth: .infinity, alignment: .leading)
                                   // tiempo
                                   Text("Hace 7 días").foregroundColor(.white).font(.subheadline)
                                       .frame(maxWidth: .infinity, alignment: .leading)

                               }.padding(.leading)
                           }
                           // Texto de comentario
                           Text("He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.")
                                   .foregroundColor(.white)
                                   .font(.subheadline)
                                   .frame(alignment: .leading)
                                   .padding(.top, 7.0)
                                   .padding(.leading, 10.0)
                                   
                          Spacer()


                       }
                       .padding(EdgeInsets(top: 11, leading: 8, bottom: 11, trailing: 11))
                       .background(Color("Blue-Bar"))
                       .clipShape(RoundedRectangle(cornerRadius: 10.0))

            
        }.frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal,11)
        
            Spacer()
        
        VStack(alignment: .leading){

            //clipshape
            
            VStack(alignment: .leading) {
                        

                           HStack {
                               // Foto
                               Image("alvy").resizable()
                                   .aspectRatio(contentMode: .fit)
                                   .frame(width: 50, height: 50)
                                   .padding(.leading, 14)
                                   .padding(.top,1)



                               VStack
                               {
                                   // Nombre usuario
                                   Text("Alvy Baack").foregroundColor(.white).font(.title3)
                                       .frame(maxWidth: .infinity, alignment: .leading)
                                   // tiempo
                                   Text("Hace 12 días").foregroundColor(.white).font(.subheadline)
                                       .frame(maxWidth: .infinity, alignment: .leading)

                               }.padding(.leading)
                           }
                           // Texto de comentario
                           Text("He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.")
                                   .foregroundColor(.white)
                                   .font(.subheadline)
                                   .frame(alignment: .leading)
                                   .padding(.top, 7.0)
                                   .padding(.leading, 10.0)
                                   
                          Spacer()


                       }
                       .padding(EdgeInsets(top: 11, leading: 8, bottom: 11, trailing: 11))
                       .background(Color("Blue-Bar"))
                       .clipShape(RoundedRectangle(cornerRadius: 10.0))

            
        }.frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal,11)

    }
}
    
struct JuegosSimilares: View{
    
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    
    @State var isPlayerActive = false
    
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body: some View{
        
        Text("JUEGOS SIMILARES")
            .font(.title3)
            .foregroundColor(.white)
            .bold()
            .padding(.leading)
            .padding(.top)
            .frame(maxWidth: .infinity, alignment: .leading)
        
        ScrollView(.horizontal,showsIndicators: false){
            

            HStack{
                
                Button(action: {url = urlVideos[4]
                    print("URL: \(url)")
                    isPlayerActive = true}, label: {
                        
                        Image("Cuphead")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                
                Button(action: {url = urlVideos[5]
                    print("URL: \(url)")
                    isPlayerActive = true}, label: {
                        
                        Image("Hades-2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                
                Button(action: {url = urlVideos[6]
                    print("URL: \(url)")
                    isPlayerActive = true}, label: {
                        
                        Image("Grand Theft Auto V")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                
                
            }


        }
        
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(url: "Ejemplo.com", titulo: "Sonic", studio: "Sega", calificacion: "E+", anoPublicacion: "1991", descripcion: "juego de Sega Genesis publicado en 1991 con mas de 40 millones de copias vendidas actualmente", tags: ["plataformas", "mascota"], imgsUrl: ["https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"])
    }
}

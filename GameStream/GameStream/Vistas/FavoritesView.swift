//
//  FavoritesView.swift
//  GameStream
//
//  Created by Yessie Rodriguez on 28/1/22.
//

import SwiftUI
import AVKit


struct FavoritesView: View {
    
    @ObservedObject var todosLoVideoJuegos = ViewModel()
    
    var body: some View {

        ZStack{
            
            
            Color("Marine").ignoresSafeArea()
            
            VStack {
                
                Text("FAVORITOS")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom,9)
                
                ScrollView{
                    
                    ForEach(todosLoVideoJuegos.gamesInfo, id: \.self) {
                        
                        juego in
                        
                        VStack (spacing: 0){
                            VideoPlayer(player: AVPlayer(url:URL(string: juego.videosUrls.mobile)!))
                                .frame(height: 300)
                            
                            Text("\(juego.title)")
                                .font(.title3)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .background(Color("Blue-Bar"))
                                .clipShape(RoundedRectangle(cornerRadius: 3.0))
                            
                        }
                    }
                    
                    
                }.padding(.bottom, 8)
                
            }.padding(.horizontal,6)
                .padding(.top,1)
            
        }
        
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}

//
//  SearchGame.swift
//  GameStream
//
//  Created by Yessie Rodriguez on 27/1/22.
//

import Foundation


class SearchGame: ObservableObject{
        
    @Published var gameInfo = [Game]()
    
    func search(gameName:String) {
        
        
        gameInfo.removeAll()
        
        let gameNameSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let url = URL(string:"https://gamestream-api.herokuapp.com/api/games/search?contains=\(gameNameSpaces ?? "cuphead")")!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
           
            do {
                
                if let jsonData = data{
                    
                    print("tamaño del Json \(jsonData)")
                    
                    let decodedData = try
                    JSONDecoder().decode(Resultado.self, from: jsonData )
                    
                    
                    DispatchQueue.main.async {
                        self.gameInfo.append(contentsOf: decodedData.results)
                    }
                    
                
            }else{
                print("No existen datos en el json recuperado")
            }
            }catch{
                
                print("Error: \(error)")
                
            }
            
        }.resume()
    }
    
    
}

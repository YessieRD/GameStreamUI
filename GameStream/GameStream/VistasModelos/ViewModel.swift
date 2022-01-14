//
//  ViewModel.swift
//  GameStream
//
//  Created by Yessie Rodriguez on 14/1/22.
//

import Foundation


class ViewModel: ObservableObject {
    
    @Published var gamesInfo = [Game]()
   
    
    init() {
        
        let url = URL(string:"https://gamestream-api.herokuapp.com/api/games")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
           
            do {
                
                if let jsonData = data{
                    
                    print("tamaño del Json \(jsonData)")
                    
                    let decodedData = try
                    JSONDecoder().decode([Game].self, from: jsonData )
                    
                    print("JSONDecodificado: \(decodedData)")

                    
                    DispatchQueue.main.async {
                        self.gamesInfo.append(contentsOf: decodedData)
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

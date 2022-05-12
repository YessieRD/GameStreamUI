//
//  GameStreamApp.swift
//  GameStream
//
//  Created by Yessie Rodriguez on 6/1/22.
//

import SwiftUI

@main
struct GameStreamApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.onChange(of: scenePhase)  { phase in
            
            
            print(phase)
            
            if phase == .inactive{
                
                print("La app esta inactiva, guardaré los datos")
            }
            
            
        }
    }
}

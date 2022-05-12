//
//  SistemaPuntos.swift
//  GameStream
//
//  Created by Yessie Rodriguez on 12/5/22.
//

import SwiftUI

struct SistemaPuntos: View {
    var body: some View {
        
        
        
        
        Rectangle().frame(width: 100, height: 100, alignment: .center)
            .foregroundColor(.blue)
    }
}

struct SistemaPuntos_Previews: PreviewProvider {
    static var previews: some View {
        SistemaPuntos()
        
        SistemaPuntos()
            .previewDevice("iPhone 8")
        
        SistemaPuntos()
            .previewDevice("iPad Pro (11-inch) (3rd generation)")

        
    }
}

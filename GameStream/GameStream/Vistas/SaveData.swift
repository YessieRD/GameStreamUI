//
//  SaveData.swift
//  GameStream
//
//  Created by Yessie Rodriguez on 4/5/22.
//

import Foundation


class SaveData {
    
    var correo: String = "
    var contraseña: String = ""
    var nombre: String = ""
    
    func guardarDatos(correo:String, contraseña:String, nombre:String) ->
    Bool {
        
        print("dentro de la funcion guardar datos obtuve: \(correo) + \(contraseña) + \(nombre)")
        
        
        UserDefaults.standard.set([correo,contraseña,nombre], forKey: "datosUsuario")
        
        return true
    }
    

        func recuperarDatos() -> [String] {
            
            let datosUsuario:[String] =
            UserDefaults.standard.stringArray(forKey: "datosUsuario")!

            print("Estoy en el metodo recuperarDatos y recupere: \(datosUsuario)")
            
            return datosUsuario
        }
    
    func validar(correo:String, contraseña:String) -> Bool {
       
        var correoGuardado = ""
        var contraseñaGuardada = ""
        
        print("Revisando si tengo datos en user defaults con el correo \(correo) y la contraseña \(contraseña)")
        
        if UserDefaults.standard.object(forKey: "datosUsuario") != nil{
            
            correoGuardado = UserDefaults.standard.stringArray(forKey: "datosUsuario")![0]
            
            contraseñaGuardada = UserDefaults.standard.stringArray(forKey: "datosUsuario")![1]
            
            print("El correo gaurdado es \(correoGuardado) y la contraseña guardada es \(contraseñaGuardada)")
            
            

            if (correo == correoGuardado && contraseña == contraseñaGuardada){
                
                return true
            }else{
                
                return false
            }
    
            
        }else{
            
            print("No hay datos de usuario guardado en el user defaults")
        
        return false
        }
    }
}

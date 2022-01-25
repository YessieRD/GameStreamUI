//
//  Model.swift
//  GameStream
//
//  Created by Yessie Rodriguez on 14/1/22.
//

import Foundation




struct Games:Codable {
    
    var game:[Game]
    
}


struct Game:Codable,Hashable{
    
    var title:String
    var studio:String
    var contentRaiting:String
    var publicationYear:String
    var description:String
    var platforms:[String]
    var tags:[String]
    var videosUrls:videoUrl
    var galleryImages:[String]
}


struct videoUrl:Codable,Hashable{
    
    var mobile:String
    var tablet:String
    
}

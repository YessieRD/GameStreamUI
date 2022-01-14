//
//  Model.swift
//  GameStream
//
//  Created by Yessie Rodriguez on 14/1/22.
//

import Foundation




struct Games:Codable {
    
    var gmaes:[Game]
    
}


struct Game:Codable{
    
    var title:String
    var studio:String
    var contentRating:String
    var pubicationYear:String
    var description:String
    var platforms:[String]
    var tags:[String]
    var videosUrls:videoUrl
    var galleryImages:[String]
}


struct videoUrl:Codable{
    
    var mobile:String
    var tablet:String
    
}

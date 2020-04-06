//
//  Headlines.swift
//  NewsApp
//
//  Created by Tushar Garg on 05/04/20.
//  Copyright © 2020 Tushar Garg. All rights reserved.
//

import Foundation

struct HeadLines:Decodable{
    var articles:[HeadLine]!
}

struct HeadLine: Decodable {
    var title: String
    var content: String
    var publishedAt: String
    
    init(title :String, content :String, publishedAt :String) {
           self.title = title
           self.content = content
           self.publishedAt = publishedAt
       }
    
}

//
//  Sources.swift
//  NewsApp
//
//  Created by Tushar Garg on 05/04/20.
//  Copyright © 2020 Tushar Garg. All rights reserved.
//

import Foundation
struct Sources: Decodable {
    var sources:[Source]
    
    init(sources: [Source]) {
        self.sources = sources
    }
}

struct Source: Decodable {
    var id :String
    var name :String
    var description :String
      
    init(id :String, name :String, description :String) {
        self.id = id
        self.name = name
        self.description = description
    }
}

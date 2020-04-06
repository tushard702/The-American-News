//
//  SourceListViewModel.swift
//  NewsApp
//
//  Created by Tushar Garg on 05/04/20.
//  Copyright © 2020 Tushar Garg. All rights reserved.
//

import Foundation

class SourceListViewModel {
    
    private var webservice :WebService
    private (set) var sourcesViewModel :[SourceViewModel] = [SourceViewModel]()
    private var completion :() -> () = {  }
    
    init(webservice :WebService, completion:@escaping () -> ()) {
        
        self.webservice = webservice
        self.completion = completion
        populateSources()
    }
    
    private func populateSources() {
        
        self.webservice.loadSources { sources in
            self.sourcesViewModel = sources.map(SourceViewModel.init)
            self.completion()
        }
    }
    
    func sourceAt(index :Int) -> SourceViewModel {
        return self.sourcesViewModel[index]
    }
}

class SourceViewModel {
    
    var id :String
    var name :String
    var description :String
    
    init(source :Source) {
        self.id = source.id
        self.name = source.name
        self.description = source.description
    }
    
    init(id :String, name :String, description :String) {
        self.id = id
        self.name = name
        self.description = description
    }
}

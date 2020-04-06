//
//  HeadlineListViewModel.swift
//  NewsApp
//
//  Created by Tushar Garg on 05/04/20.
//  Copyright © 2020 Tushar Garg. All rights reserved.
//

import Foundation

class HeadlineListViewModel{
    
    private var webservice :WebService
    var source:SourceViewModel
    private (set) var headlinesViewModel :[HeadlineViewModel] = [HeadlineViewModel]()
    private var completion :() -> () = {  }
    
    init(source: SourceViewModel, webservice: WebService, completion: @escaping () -> ()) {
        
        self.source = source
        self.webservice = webservice
        self.completion = completion
        
        populateHeadlines()
    }
    
    func populateHeadlines(){
        
        webservice.loadHeadlinesForSource(source: source){ headlines in
            self.headlinesViewModel = headlines.map(HeadlineViewModel.init)
            self.completion()
        }
    }
    
    func headlineAt(index :Int) -> HeadlineViewModel {
           return self.headlinesViewModel[index]
       }
}

class HeadlineViewModel{
    
    var title: String
    var content: String
    var publishedAt: String
    
    init(headline :HeadLine) {
        self.title = headline.title
        self.content = headline.content
        self.publishedAt = headline.publishedAt
    }
}

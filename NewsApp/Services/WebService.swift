//
//  WebService.swift
//  NewsApp
//
//  Created by Tushar Garg on 05/04/20.
//  Copyright © 2020 Tushar Garg. All rights reserved.
//

import Foundation

class WebService{
    
    func loadSources(completion : @escaping ([Source]) -> ()) {
         
        guard let sourceURL = URL(string :"https://newsapi.org/v2/sources?apiKey=93aefe6022154309b74296b49e096484") else {return}
         
         URLSession.shared.dataTask(with: sourceURL) { data, _, _ in
             
            guard let data = data else {return}
            
            do{
                let sources = try JSONDecoder().decode(Sources.self, from: data)
                DispatchQueue.main.async {
                    completion(sources.sources)
                    
                }
            }catch {}
            
        }.resume()
     }
    
     func loadHeadlinesForSource(source :SourceViewModel, completion :@escaping ([HeadLine]) -> ()) {
         
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=\(source.id)&apiKey=93aefe6022154309b74296b49e096484") else {return}
         
         URLSession.shared.dataTask(with: url) { data, _, _ in
            
            guard let data = data else {return}
            
            do{
                let headlines = try JSONDecoder().decode(HeadLines.self, from: data)
                DispatchQueue.main.async {
                    completion(headlines.articles)
                }
            }catch {}
        }.resume()
     }
}

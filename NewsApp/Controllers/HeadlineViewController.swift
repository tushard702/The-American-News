//
//  headlineViewController.swift
//  NewsApp
//
//  Created by Tushar Garg on 05/04/20.
//  Copyright © 2020 Tushar Garg. All rights reserved.
//

import Foundation
import UIKit

class HeadlineViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    var source: SourceViewModel?
    var webservice: WebService!
    var headlineListViewModel: HeadlineListViewModel!
    
    override func viewDidLoad() {
        self.title = source?.name
          
        collectionView?.backgroundColor = .white
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(HeadlineViewCell.self, forCellWithReuseIdentifier: "cell")
          
        webservice = WebService()
        headlineListViewModel = HeadlineListViewModel(source: source!, webservice: webservice){
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headlineListViewModel.headlinesViewModel.count
     }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HeadlineViewCell
        let headline = headlineListViewModel.headlineAt(index: indexPath.row)
        
        cell.titleLabel.text = "Headline:   \(headline.title)"
        cell.discriptionLabel.text = "\(headline.content)"
        
        return cell
    }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          
           return CGSize(width: view.bounds.width-10, height: 240)
      }
}

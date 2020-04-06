//
//  ViewController.swift
//  NewsApp
//
//  Created by Tushar Garg on 05/04/20.
//  Copyright © 2020 Tushar Garg. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{

    private var webservice :WebService!
    private var sourceListViewModel :SourceListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "All Sources"
        
        
        collectionView?.backgroundColor = .white
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(SourceViewCell.self, forCellWithReuseIdentifier: "cell")
        
        webservice = WebService()
        sourceListViewModel = SourceListViewModel(webservice: self.webservice){
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sourceListViewModel.sourcesViewModel.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SourceViewCell
        let source = sourceListViewModel.sourceAt(index: indexPath.row)
        
        cell.titleLabel.text = source.name
        cell.discriptionLabel.text = source.description
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 40
        
        let contoller = HeadlineViewController(collectionViewLayout: layout)
        contoller.source = sourceListViewModel.sourceAt(index: indexPath.row)
            
        navigationController?.pushViewController(contoller, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        return CGSize(width: view.bounds.width-10, height: 240)
   }

}


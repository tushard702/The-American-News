//
//  HeadlineViewCell.swift
//  NewsApp
//
//  Created by Tushar Garg on 05/04/20.
//  Copyright © 2020 Tushar Garg. All rights reserved.
//

import Foundation
import UIKit

class HeadlineViewCell: UICollectionViewCell{
    
    let titleLabel: UILabel = UILabel()
    let discriptionLabel: UILabel = UILabel()
    let timeLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 14
        self.layer.shadowColor = UIColor.black.cgColor
       //
        self.layer.shadowOffset = CGSize(width: 2.0, height: 1.0)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.8
        
        setupViews()
    }
    
    func setupViews(){
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
          
          
        addSubview(discriptionLabel)
        discriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        discriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        discriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        discriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        discriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
    
        discriptionLabel.textAlignment = .left
        discriptionLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        discriptionLabel.textColor = .black
        discriptionLabel.numberOfLines = 0
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

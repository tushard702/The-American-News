//
//  SourceTableViewCell.swift
//  NewsApp
//
//  Created by Tushar Garg on 05/04/20.
//  Copyright © 2020 Tushar Garg. All rights reserved.
//

import Foundation
import  UIKit

class SourceViewCell: UICollectionViewCell{
    
    let titleLabel: UILabel = UILabel()
    let discriptionLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
        self.layer.cornerRadius = 16
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
        self.layer.shadowRadius = 12.0
        self.layer.shadowOpacity = 1
        
        setupViews()
    }
    
    func setupViews(){
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 32).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -32).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .white
        titleLabel.backgroundColor = .black
          
          
        addSubview(discriptionLabel)
        discriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        discriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        discriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        discriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        discriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
    
        discriptionLabel.textAlignment = .left
        discriptionLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        discriptionLabel.textColor = .orange
        discriptionLabel.numberOfLines = 0
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

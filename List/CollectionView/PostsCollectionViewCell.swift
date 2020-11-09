//
//  PostsCollectionViewCell.swift
//  List
//
//  Created by Альберт on 09.11.2020.
//

import UIKit

class PostsCollectionViewCell: UICollectionViewCell {
    
    
    
    //    static let reuseId = "PostsCollectionViewCell"
    
    let userIdLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //
        let idLabel: UILabel = {
            let label = UILabel()
            label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            label.backgroundColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    //
        let titleLabel: UILabel = {
            let label = UILabel()
            label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            label.backgroundColor = .white
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
        let bodyLabel: UILabel = {
            let label = UILabel()
            label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            label.backgroundColor = .white
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(userIdLabel)
        addSubview(idLabel)
        addSubview(titleLabel)
        addSubview(bodyLabel)
//        userIdLabel.textAlignment = .center
        userIdLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        userIdLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        userIdLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
//        userIdLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        userIdLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        idLabel.leadingAnchor.constraint(equalTo: userIdLabel.leadingAnchor).isActive = true
        idLabel.trailingAnchor.constraint(equalTo: userIdLabel.trailingAnchor).isActive = true
        idLabel.topAnchor.constraint(equalTo: userIdLabel.bottomAnchor, constant: 10).isActive = true
        idLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        titleLabel.leadingAnchor.constraint(equalTo: idLabel.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: idLabel.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        bodyLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        bodyLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        bodyLabel.heightAnchor.constraint(equalToConstant: 60)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


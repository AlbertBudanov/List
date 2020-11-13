//
//  PostsCollectionViewCell.swift
//  List
//
//  Created by Альберт on 09.11.2020.
//

import UIKit

class PostsCollectionViewCell: UICollectionViewCell {
    
    let userIdLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.backgroundColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let idLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.backgroundColor = .white
        label.numberOfLines = 0
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
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.backgroundColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
//        не работает
        label.lineBreakMode = .byCharWrapping

        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configure()
    }
    
    private func configure(){
        setupViews()
    }
    
    
    fileprivate func setupViews() {
        let superview = self.contentView
        superview.addSubview(userIdLabel)
        superview.addSubview(idLabel)
        superview.addSubview(titleLabel)
        superview.addSubview(bodyLabel)
        superview.backgroundColor = #colorLiteral(red: 1, green: 0.8114075661, blue: 0.9726718068, alpha: 1)
        superview.layer.cornerRadius = 10
        
        userIdLabel.topAnchor.constraint(equalTo: superview.topAnchor, constant: 16).isActive = true
        userIdLabel.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: 16).isActive = true
        superview.trailingAnchor.constraint(equalTo: self.userIdLabel.trailingAnchor, constant: 16).isActive = true
        
        idLabel.topAnchor.constraint(equalTo: userIdLabel.bottomAnchor, constant: 16).isActive = true
        idLabel.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: 16).isActive = true
        superview.trailingAnchor.constraint(equalTo: self.idLabel.trailingAnchor, constant: 16).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 16).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: 16).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: -16).isActive = true
        superview.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor, constant: 16).isActive = true
        
        bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        bodyLabel.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: 16).isActive = true
        bodyLabel.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -16).isActive = true
        superview.trailingAnchor.constraint(equalTo: self.bodyLabel.trailingAnchor, constant: 16).isActive = true
    }
    
    func setCell(post: Post) {
        userIdLabel.text = "User id: " + String(post.userId)
        idLabel.text = "Id: " + String(post.id)
        titleLabel.text = "Title: " + post.title
        bodyLabel.text = "Body: " + post.body
    }
    override public func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let targetSize: CGSize
        let horizontalPriority: UILayoutPriority
        let verticalPriority: UILayoutPriority
        targetSize = .init(width: layoutAttributes.size.width, height: UIView.layoutFittingCompressedSize.height)
        horizontalPriority = .required
        verticalPriority = .defaultLow
        layoutAttributes.size = self.contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalPriority, verticalFittingPriority: verticalPriority)
        layoutAttributes.size.height.round(.up)
        layoutAttributes.size.width.round(.up)
        return layoutAttributes
    }
    
}


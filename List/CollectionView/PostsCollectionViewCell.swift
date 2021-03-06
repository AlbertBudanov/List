//
//  PostsCollectionViewCell.swift
//  List
//
//  Created by Альберт on 09.11.2020.
//

import UIKit



class PostsCollectionViewCell: UICollectionViewCell {
    
    var userIdLabel: Label!
    var idLabel: Label!
    var titleLabel: Label!
    var bodyLabel: Label!
    
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
        self.userIdLabel = Label()
        self.userIdLabel.apply(style: .default)
        
        self.idLabel = Label()
        self.idLabel.apply(style: .default)
        
        self.titleLabel = Label()
        self.titleLabel.apply(style: .default)
        
        self.bodyLabel = Label()
        self.bodyLabel.apply(style: .default)
        
        
        let superview = self.contentView
        [self.userIdLabel, self.idLabel, self.titleLabel, self.bodyLabel].forEach { (label) in
            label.translatesAutoresizingMaskIntoConstraints = false
        }
        
      
        let stackView = UIStackView(arrangedSubviews: [self.userIdLabel, self.idLabel, self.titleLabel, self.bodyLabel])
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 8
        
        superview.addSubviewForAutolayout(stackView)
        stackView.topAnchor.constraint(equalTo: superview.topAnchor, constant: 16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -16).isActive = true
        stackView.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: 16).isActive = true
        stackView.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -16).isActive = true
        
        
        superview.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        superview.layer.cornerRadius = 20
        
        
        superview.layer.masksToBounds = false
        superview.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65).cgColor
        superview.layer.shadowOpacity = 0.8
        superview.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        superview.layer.shadowRadius = 5.0
        superview.layer.cornerRadius = 5.0
    
       
    }
    
    func fill(data: PostsCollectionViewCell.Data) {
        self.userIdLabel.text = data.userID
        self.idLabel.text = data.id
        self.titleLabel.text = data.title
        self.bodyLabel.text = data.body
    }
    
    func fillPhotos(data: PostsCollectionViewCell.PhotosData) {
        self.userIdLabel.text = data.albumId
        self.idLabel.text = data.id
        self.titleLabel.text = data.title
        self.bodyLabel.text = data.url
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

extension PostsCollectionViewCell{
    public struct Data{
        var userID: String
        var id: String
        var title: String
        var body: String
        public init(userID: String, id: String, title: String, body: String){
            self.userID = userID
            self.id = id
            self.title = title
            self.body = body
        }
    }
}


extension PostsCollectionViewCell{
    public struct PhotosData{
      
        var albumId: String
        var id: String
        var title: String
        var url: String
        var thumbnailUrl: String
        public init(albumId: String, id: String, title: String, url: String, thumbnailUrl: String){
            self.albumId = albumId
            self.id = id
            self.title = title
            self.url = url
            self.thumbnailUrl = thumbnailUrl
        }
    }
}

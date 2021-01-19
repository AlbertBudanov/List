//
//  PhotosCollectionViewCell.swift
//  List
//
//  Created by Альберт on 27.11.2020.
//

import UIKit
import SDWebImage
import Kingfisher

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var authorIdLabel: Label!
    var idLabel: Label!
    var titleLabel: Label!
    var thumbnailUrlLabel: Label!
    
    var urlLabel: UIImageView!
    
    
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
        self.authorIdLabel = Label()
        self.authorIdLabel.apply(style: .default)
        
        self.idLabel = Label()
        self.idLabel.apply(style: .default)
        
        self.titleLabel = Label()
        self.titleLabel.apply(style: .default)
        
        self.urlLabel = UIImageView()

        
        let superview = self.contentView
        [self.authorIdLabel, self.idLabel, self.titleLabel, self.urlLabel].forEach { (label) in
            label.translatesAutoresizingMaskIntoConstraints = false
        }
        
      
       
        
        let stackView = UIStackView(arrangedSubviews: [self.authorIdLabel, self.idLabel, self.titleLabel])
        
       
        
        
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 8
        
        superview.addSubviewForAutolayout(stackView)
        
//
//        urlLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        urlLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
//        urlLabel.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: 0).isActive = true
//        urlLabel.autoresizesSubviews = true
        
        stackView.topAnchor.constraint(equalTo: superview.topAnchor, constant: 16).isActive = true
//        stackView.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -16).isActive = true
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
        
        superview.addSubviewForAutolayout(urlLabel)

        
        urlLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        urlLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        urlLabel.centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: 0).isActive = true
        urlLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor , constant: 20).isActive = true
        urlLabel.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -16).isActive = true
        
    
       
    }
    
    func fillPhotos(data: PhotosCollectionViewCell.PhotosData) {
        self.authorIdLabel.text = data.albumId
        self.idLabel.text = data.id
        self.titleLabel.text = data.title
        
//        let url = URL(string: data.url)
//        urlLabel.kf.setImage(with: url)
//        let transformer =  SDImageResizingTransformer ( size : CGSize ( width: 100 , height: 100 ), scaleMode: .fill)
//        self.urlLabel.sd_setImage ( with: url, placeholderImage : nil , context : [. imageTransformer : transformer])
        
        

        self.urlLabel.sd_setImage(with: URL(string: "\(data.url)" ), completed: nil)
        
        
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

extension PhotosCollectionViewCell{
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


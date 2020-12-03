//
//  UICollectionViewLayout.swift
//  List
//
//  Created by Альберт on 13.11.2020.
//

import UIKit

extension UICollectionViewLayout {
    public static var verticalFlow: UICollectionViewFlowLayout {
        let result = UICollectionViewFlowLayout()
        result.scrollDirection = .vertical

        result.minimumLineSpacing = 10
        result.minimumInteritemSpacing = 10
        return result
    }
    
    public static var horizontalFlow: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        return layout
    }
}


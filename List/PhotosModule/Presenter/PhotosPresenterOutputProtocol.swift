//
//  PhotosPresenterOutputProtocol.swift
//  List
//
//  Created by Альберт on 27.11.2020.
//

import Foundation

protocol PhotosPresenterOutputProtocol: class {
    func succes()
    func failure(error: Error)
    func update(items: [PhotosCollectionViewCell.PhotosData])
}

//
//  MainPresenterOutput.swift
//  List
//
//  Created by Альберт on 19.11.2020.
//

import Foundation

protocol MainPresenterOutputProtocol: class {
    func succes()
    func failure(error: Error)
    func update(items: [PostsCollectionViewCell.Data])
    func update(item: PostsCollectionViewCell.Data, at row: Int)
}

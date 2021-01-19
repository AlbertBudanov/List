//
//  PhotosPresenterInputProtocol.swift
//  List
//
//  Created by Альберт on 27.11.2020.
//

import Foundation

protocol PhotosPresenterInputProtocol: class {
    init(view: PhotosPresenterOutputProtocol, apiManager: APIManager)

    func getComments()
}

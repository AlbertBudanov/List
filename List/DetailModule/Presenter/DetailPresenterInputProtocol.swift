//
//  DetailPresenterInputProtocol.swift
//  List
//
//  Created by Альберт on 25.11.2020.
//

import Foundation

protocol DetailPresenterInputProtocol: class {
    init(view: DetailPresenterOutputProtocol, apiManager: APIManager, post: Post?)
    func setPost()
}

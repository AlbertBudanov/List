//
//  DetailPresenter.swift
//  List
//
//  Created by Альберт on 25.11.2020.
//

import Foundation

class DetailPresenter: DetailPresenterInputProtocol {
    weak var view: DetailPresenterOutputProtocol?
    var apiManager: APIManager = APIManagerImpl()
    var post: Post?
    
    required init(view: DetailPresenterOutputProtocol, apiManager: APIManager, post: Post?) {
        self.view = view
        self.apiManager = apiManager
    }
    
    public func setPost() {
        self.view?.setPost(post: post)
    }
}

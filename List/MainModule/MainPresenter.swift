//
//  MainPresenter.swift
//  List
//
//  Created by Альберт on 23.11.2020.
//

import Foundation
import UIKit

class MainPresenter: MainPresenterInputProtocol {
    
    
    
   weak var view: MainPresenterOutputProtocol?
    var apiManager: APIManager = APIManagerImpl()
    

    var posts: [Post] = [Post]()
    
    required init(view: MainPresenterOutputProtocol, apiManager: APIManager) {
        self.view = view
        self.apiManager = apiManager
        getComments()

    }
    func getComments() {
            apiManager.fetchPost().done { [weak self] (posts) in
                guard let strongSelf = self else { return }
                strongSelf.posts = posts
                let items = strongSelf.posts.compactMap { (post) -> PostsCollectionViewCell.Data in
                    let item = PostsCollectionViewCell.Data.init(userID: "User Id: \(post.userId ?? 0)",
                                                                 id: "Id: \(post.id ?? 0)",
                                                                 title: "Title: \(post.title ?? "")",
                                                                 body: "Body: \(post.body ?? "")")
                    return item
                }
                
                self?.view?.update(items: items)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                    let item = PostsCollectionViewCell.Data.init(userID: "Custom user",
                                                                 id: "custom id",
                                                                 title: "Title: fvdjbfvbdfbvdbfhjvbdlhjfvjb djhfvbdfbjvhb djlf ",
                                                                 body: "Body: bdfjhbvdbfbvdjbfj vjdvje dfjv f dj vl")
                    self?.view?.update(item: item, at: 1)
                    
                }
            }.catch { (error) in
                if let error = error as? APIError{
                    print(error.message)
//                self.setAlert(error: error.message)
                 
                }
                print(error)
            }
        }
    }

        
    

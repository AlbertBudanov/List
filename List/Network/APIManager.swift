//
//  APIManager.swift
//  List
//
//  Created by Альберт on 07.11.2020.
//

import Foundation
import PromiseKit


protocol APIManager {
    func fetchPost()->Promise<[Post]>
    func fetchPost(id: String)->Promise<Post>
}

class APIManagerImpl: BaseRequest, APIManager{
    
    public func fetchPost()->Promise<[Post]>{
        return self.request(APIRoutes.posts)
    }
    
    public func fetchPost(id: String)->Promise<Post>{
        return self.request(APIRoutes.post(id: id))
    }
    
}



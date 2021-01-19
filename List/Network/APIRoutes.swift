//
//  APIRoutes.swift
//  List
//
//  Created by Альберт on 07.11.2020.
//

import Foundation
import Alamofire


enum APIRoutes: URLRequestConvertible{
    
    case posts
    case post(id: String)
    case photos
    
    
    static let baseURL: String = "https://jsonplaceholder.typicode.com/"
    
    var path: String{
        switch self{
        case .posts:
            return "posts"
        case .post(let id):
            return "posts/\(id)"
        case .photos:
            return "photos"
        }
    }
    
    var method: HTTPMethod{
        switch self {
        case .posts,.post,.photos:
            return .get
        }
    }
    
    var headers: [String: String]?{
        switch self{
        case .posts, .post, .photos:
            return nil
        }
    }
    
    var params: [String: Any]?{
        switch self{
        case .posts:
            return nil
//            return ["id":10]
        default:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try URL(string: Self.baseURL)!.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        if self.method == .get {
            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
        } else {
            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
        }
        return urlRequest
    }
    
}

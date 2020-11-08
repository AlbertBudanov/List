//
//  BaseRequest.swift
//  List
//
//  Created by Альберт on 07.11.2020.
//

import Foundation
import Alamofire
import PromiseKit

class BaseRequest: NSObject{
    
    func request<T: Decodable>(_ urlConvertible: Alamofire.URLRequestConvertible)->Promise<T>{
        return Promise{ seal in
            AF.request(urlConvertible).response { (response) in
                if let statusCode = response.response?.statusCode{
                    switch statusCode {
                    case 200...299:
                        if let data = response.data {
                            do {
                                let result = try JSONDecoder().decode(T.self, from: data)
                                seal.fulfill(result)
                            } catch (let error){
//                                MARK: parsing error check your model
                                print(error)
                                seal.reject(error)
                            }
                        } else {
//                            MARK: Empty response add new APIError
                            seal.reject(APIError.unknown)
                        }
                    default:
                        if let error  = APIError(from: statusCode){
                            seal.reject(error)
                        } else {
                            seal.reject(APIError.unknown)
                        }
                    }
                }
            }
        }
        
        
    }
    
}

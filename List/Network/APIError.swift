//
//  ApiError.swift
//  List
//
//  Created by Альберт on 07.11.2020.
//

import Foundation

enum APIError: Error {
    case internalServerError
    case serviceTemporaryUnavailable
    case unknown
    
    
    var message: String{
        switch self{
        case .internalServerError: return "Внутренняя ошибка сервера"
        default:
            return "Error"
        }
    }
    
//    MARK: добавить другие статусы ошибок смотри проект по спорту, там есть подобные ошибки
    
    init?(from statusCode: Int) {
        switch statusCode{
        case 500: self = .internalServerError
        case 503: self = .serviceTemporaryUnavailable
        default: self = .unknown
        }
    }
}

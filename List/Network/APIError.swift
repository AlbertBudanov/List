//
//  ApiError.swift
//  List
//
//  Created by Альберт on 07.11.2020.
//

import Foundation

enum APIError: Error {
    case parsingError
    case conflict
    case notFound
    case forbidden
    case internalServerError
    case serviceTemporaryUnavailable
    case unknown
    
    
    var message: String{
        switch self{
        case .internalServerError: return "Внутренняя ошибка сервера"
        case .conflict: return "Конфликт"
        case .notFound: return "404"
        case .forbidden: return "Доступ запрещен"
        case .serviceTemporaryUnavailable: return "Сервис временно недоступен"
        default:
            return "Error"
        }
    }
    
//    MARK: добавить другие статусы ошибок смотри проект по спорту, там есть подобные ошибки
    
    init?(from statusCode: Int) {
        switch statusCode{
        case 403: self = .forbidden
        case 404: self = .notFound
        case 409: self = .conflict
        case 500: self = .internalServerError
        case 503: self = .serviceTemporaryUnavailable
        default: self = .unknown
        }
    }
}

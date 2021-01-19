//
//  MainPresenterInput.swift
//  List
//
//  Created by Альберт on 23.11.2020.
//

import Foundation

protocol MainPresenterInputProtocol: class {
    init(view: MainPresenterOutputProtocol, apiManager: APIManager)

    func getComments()
}


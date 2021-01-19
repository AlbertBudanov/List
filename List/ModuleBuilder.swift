//
//  ModuleBuilder.swift
//  List
//
//  Created by Альберт on 20.11.2020.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
    static func createPhotosModule() -> UIViewController
}

class ModelBuilder: Builder {
    static func createMainModule() -> UIViewController {

        let view = ViewController()
        let apiManager: APIManager = APIManagerImpl()
        let presenter = MainPresenter(view: view, apiManager: apiManager)
        view.presenter = presenter
        return view
    }
    
    static func createPhotosModule() -> UIViewController {

        let view = PhotosViewController()
        let apiManager: APIManager = APIManagerImpl()
        let presenter = PhotosPresenter(view: view, apiManager: apiManager)
        view.presenter = presenter
        return view
    }
}

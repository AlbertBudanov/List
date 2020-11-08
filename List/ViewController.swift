//
//  ViewController.swift
//  List
//
//  Created by Альберт on 07.11.2020.
//

import UIKit

class ViewController: UIViewController {

    var apiManager: APIManager = APIManagerImpl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiManager.fetchPost().done { [weak self] (posts) in
            guard let strongSelf = self else { return }
            
            strongSelf.routeToDetail()
            print(posts)
        }.catch { (error) in
            if let error = error as? APIError{
                print(error.message)
            }
            print(error)
        }
        // Do any additional setup after loading the view.
    }

    
//    MARK: route for detail
    func routeToDetail(){
        
        
    }

}


/*
 
 1.Получить все посты по API, вывести на экран в UICollectionView (self.collectionView.reloadData())
 2. По нажатию на ячеку открывать DetailViewController, передавать в него id поста, на экране стартовать загрузку контента, по загрузке выводить на экран
 3. Архитектура MVP
 4. Запросы Alamofire + PromiseKit. Дополнить коды ошибок (APIError), при получении ошибки выводить UIAlertController с заголовком "Ошибка", текстом ошибки (смотри message в APIError)  c кнопко Retry, по нажатию на которую повторять запрос
 5. Создать Git репозиторий, залить код и дать доступы посмотреть
 
 
 */

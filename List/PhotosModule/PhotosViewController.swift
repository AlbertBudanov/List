//
//  PhotosViewController.swift
//  List
//
//  Created by Альберт on 27.11.2020.
//

import UIKit

class PhotosViewController: UIViewController {

    var photosCollectionView: UICollectionView!
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    var dataSource = [PhotosCollectionViewCell.PhotosData]()
    
    var presenter: PhotosPresenterInputProtocol!
    //MARK: - Life cycle
    
    override func loadView() {
        let view = UIView()
        self.collectionViewFlowLayout =  .verticalFlow
        
        self.photosCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.collectionViewFlowLayout)
        self.photosCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.photosCollectionView.backgroundColor = #colorLiteral(red: 0.9999113679, green: 0.9385440946, blue: 0.9857416749, alpha: 1)
        self.photosCollectionView.contentInset = .init(top: 10, left: 30, bottom: 50, right: 30)
        self.photosCollectionView.dataSource = self
        self.photosCollectionView.delegate = self
        
        view.addSubview(self.photosCollectionView)
        self.photosCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.photosCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.photosCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.photosCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    
       

        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.photosCollectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collectionViewFlowLayout.estimatedItemSize = CGSize(width: view.bounds.size.width - 60, height: 10)
        
    }
  
    func routeToDetail(){
    }
    
//        MARK: setAlert
            func setAlert(error: String) {
                let errorAlert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
                let action = UIAlertAction(title: "Retry", style: .default) { (errorAlert) in
//                    self.loadInfo()
                }
                errorAlert.addAction(action)
                self.present(errorAlert, animated: true, completion: nil)
        }
}




extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegate  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = photosCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PhotosCollectionViewCell {
            cell.fillPhotos(data: dataSource[indexPath.row])
            
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    //   MARK: - Open detail
    
   
//        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    
//            let storyboard = UIStoryboard(name: "DetailViewController", bundle: nil)
//            let vc = storyboard.instantiateInitialViewController() as! DetailViewController
////            vc.id = "\(self.posts?[indexPath.row].userId ?? 0)"
//            self.present(vc, animated: true, completion: nil)
//        }
}

extension PhotosViewController: PhotosPresenterOutputProtocol {

//        udapte cell in collectionView
//        self.postsCollectionView.reloadItems(at: [[0]])

    func update(items: [PhotosCollectionViewCell.PhotosData]) {
        self.dataSource = items
        self.photosCollectionView.reloadData()
    }

    func succes() {
        self.photosCollectionView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}



// MARK: Task
/*
 1.Получить все посты по API, вывести на экран в UICollectionView (self.collectionView.reloadData())
 2. По нажатию на ячеку открывать DetailViewController, передавать в него id поста, на экране стартовать загрузку контента, по загрузке выводить на экран
 3. Архитектура MVP
 4. Запросы Alamofire + PromiseKit. Дополнить коды ошибок (APIError), при получении ошибки выводить UIAlertController с заголовком "Ошибка", текстом ошибки (смотри message в APIError)  c кнопко Retry, по нажатию на которую повторять запрос
 5. Создать Git репозиторий, залить код и дать доступы посмотреть
 */



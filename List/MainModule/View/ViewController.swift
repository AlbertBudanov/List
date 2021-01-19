//
//  ViewController.swift
//  List
//
//  Created by Альберт on 07.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    
    var postsCollectionView: UICollectionView!
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    var dataSource = [PostsCollectionViewCell.Data]()
    
    var presenter: MainPresenterInputProtocol!
    //MARK: - Life cycle
    
    override func loadView() {
        let view = UIView()
        self.collectionViewFlowLayout =  .verticalFlow
        
        self.postsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.collectionViewFlowLayout)
        self.postsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.postsCollectionView.backgroundColor = #colorLiteral(red: 0.9999113679, green: 0.9385440946, blue: 0.9857416749, alpha: 1)
        self.postsCollectionView.contentInset = .init(top: 10, left: 30, bottom: 50, right: 30)
        self.postsCollectionView.dataSource = self
        self.postsCollectionView.delegate = self
        
        view.addSubview(self.postsCollectionView)
        self.postsCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.postsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.postsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.postsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    
       

        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.postsCollectionView.register(PostsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collectionViewFlowLayout.estimatedItemSize = CGSize(width: view.bounds.size.width - 60, height: 10)
        
    }
    
    //    MARK: LoadInfo
    //    func loadInfo() {
    //        apiManager.fetchPost().done { [weak self] (posts) in
    //            guard let strongSelf = self else { return }
    //            strongSelf.routeToDetail()
    //            self?.posts = posts
    //            print(posts)
    //            self?.postsCollectionView.reloadData()
    //
    //        }.catch { (error) in
    //            if let error = error as? APIError{
    ////                print(error.message)
    //                self.setAlert(error: error.message)
    //            }
    //            print(error)
    //        }
    //    }
    
    //    MARK: route for detail
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



// MARK: - Protocols
//extension ViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//    }
//
//}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = postsCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PostsCollectionViewCell {
            cell.fill(data: dataSource[indexPath.row])
            
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    //   MARK: - Open detail
    
   
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
            let storyboard = UIStoryboard(name: "DetailViewController", bundle: nil)
            let vc = storyboard.instantiateInitialViewController() as! DetailViewController
//            vc.id = "\(self.posts?[indexPath.row].userId ?? 0)"
            self.present(vc, animated: true, completion: nil)
        }
}

extension ViewController: MainPresenterOutputProtocol {
    
    func update(item: PostsCollectionViewCell.Data, at row: Int){
        self.dataSource[row] = item
//        udapte cell in collectionView
//        self.postsCollectionView.reloadItems(at: [[0]])
//


        
    }
    
    func update(items: [PostsCollectionViewCell.Data]) {
        self.dataSource = items
        self.postsCollectionView.reloadData()
    }

    func succes() {
        self.postsCollectionView.reloadData()
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

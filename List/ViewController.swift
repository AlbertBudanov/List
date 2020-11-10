//
//  ViewController.swift
//  List
//
//  Created by Альберт on 07.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    
    var postsCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    var apiManager: APIManager = APIManagerImpl()
    //    private var postsCollectionView = PostsCollectionView()
    var posts = [Post]()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadInfo()
        setCollectionView()
    }
    
    
    //    MARK: LoadInfo
    func loadInfo() {
        apiManager.fetchPost().done { [weak self] (posts) in
            guard let strongSelf = self else { return }
            
            strongSelf.routeToDetail()
            
            self?.posts = posts
            
            print(posts)
            
            
            self?.postsCollectionView.reloadData()
            
            
            
        }.catch { (error) in
            if let error = error as? APIError{
//                print(error.message)
                self.setAlert(error: error.message)
            }
            print(error)
        }
    }
    
    //    MARK: route for detail
    func routeToDetail(){
        
        
    }
    
    //    MARK: setCollectionView
    func setCollectionView() {
        view.addSubview(postsCollectionView)
        postsCollectionView.backgroundColor = .white
        postsCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        postsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        postsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        postsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        postsCollectionView.dataSource = self
        postsCollectionView.delegate = self
        postsCollectionView.register(PostsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
//    MARK: setAlert
    func setAlert(error: String) {
        let errorAlert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "Retry", style: .default) { (errorAlert) in
            self.loadInfo()
        }
        errorAlert.addAction(action)
        self.present(errorAlert, animated: true, completion: nil)
    }
}



// MARK: - Protocols
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = postsCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PostsCollectionViewCell
        cell.setCell(post: posts[indexPath.row])
        return cell
    }
    
//    layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = postsCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PostsCollectionViewCell
        return CGSize(width: UIScreen.main.bounds.width - 10, height: 310)
    }
    
//   MARK: - Open detail
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "DetailViewController", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! DetailViewController
        vc.id = "\(posts[indexPath.row].id)"
        self.present(vc, animated: true, completion: nil)
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

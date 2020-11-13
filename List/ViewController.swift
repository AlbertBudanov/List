//
//  ViewController.swift
//  List
//
//  Created by Альберт on 07.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
//    var postsCollectionView:UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.translatesAutoresizingMaskIntoConstraints = false
//        return cv
//    }()
    
    var postsCollectionView: UICollectionView!
    var collectionViewFlowLayout: UICollectionViewFlowLayout!

    var apiManager: APIManager = APIManagerImpl()
    //    private var postsCollectionView = PostsCollectionView()
    var posts = [Post]()
    
    //MARK: - Life cycle
    
    override func loadView() {
        let view = UIView()
        self.collectionViewFlowLayout =  .verticalFlow
        self.postsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.collectionViewFlowLayout)
        self.postsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.postsCollectionView.backgroundColor = #colorLiteral(red: 0.9999113679, green: 0.9385440946, blue: 0.9857416749, alpha: 1)
        
//        self.postsCollectionView.backgroundColor = UIColor.white
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
        
        loadInfo()
        self.postsCollectionView.register(PostsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")

//        setCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collectionViewFlowLayout.estimatedItemSize = CGSize(width: view.bounds.size.width - 100, height: 100)
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
//    func setCollectionView() {
//        view.addSubview(postsCollectionView)
//        postsCollectionView.backgroundColor = .white
//        postsCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        postsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        postsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        postsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//
//        postsCollectionView.dataSource = self
//        postsCollectionView.delegate = self
//        postsCollectionView.register(PostsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//    }
    
    
    
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
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = postsCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PostsCollectionViewCell {
        cell.setCell(post: posts[indexPath.row])
        return cell
    } else {
        return UICollectionViewCell()
    }
    }
//    layout
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let label = UILabel(frame: CGRect.zero)
//        label.numberOfLines = 0
////        label.frame = CGRect(x: 0, y: 0, width: postsCollectionView.frame.width - 20, height: 100)
//        label.text = posts[indexPath.row].body
//        label.sizeToFit()
//        return CGSize(width: 50, height: 50)
        
//    }
    
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

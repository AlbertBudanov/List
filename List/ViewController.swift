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
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        loadInfo()
        setCollectionView()
        // Do any additional setup after loading the view.
    }

    
//    MARK: LoadInfo
    func loadInfo() {
        apiManager.fetchPost().done { [weak self] (posts) in
            guard let strongSelf = self else { return }
            
            self?.posts = posts
            
            print(posts)
            
            self?.postsCollectionView.reloadData()

            strongSelf.routeToDetail()
        }.catch { (error) in
            if let error = error as? APIError{
                print(error.message)
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
}


/*
 
 1.Получить все посты по API, вывести на экран в UICollectionView (self.collectionView.reloadData())
 2. По нажатию на ячеку открывать DetailViewController, передавать в него id поста, на экране стартовать загрузку контента, по загрузке выводить на экран
 3. Архитектура MVP
 4. Запросы Alamofire + PromiseKit. Дополнить коды ошибок (APIError), при получении ошибки выводить UIAlertController с заголовком "Ошибка", текстом ошибки (смотри message в APIError)  c кнопко Retry, по нажатию на которую повторять запрос
 5. Создать Git репозиторий, залить код и дать доступы посмотреть
 
 
 */


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = postsCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PostsCollectionViewCell
        cell.layer.cornerRadius = 20
        cell.backgroundColor = #colorLiteral(red: 1, green: 0.8982171416, blue: 0.8455123305, alpha: 1)
        cell.userIdLabel.text = "User id: \(posts[indexPath.row].userId)"
        cell.idLabel.text = "Id: \(posts[indexPath.row].id)"
        cell.titleLabel.text = "Title: \(posts[indexPath.row].title)"
        cell.bodyLabel.text = "Body: \(posts[indexPath.row].body)"
        return cell
    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 20, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "DetailViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "Detail")
        self.present(vc, animated: true, completion: nil)
        //        print("\(posts[indexPath.row].id), title: \(posts[indexPath.row].title)")
    }
}

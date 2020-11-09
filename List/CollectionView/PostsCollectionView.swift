//
//  PostsCollectionView.swift
//  List
//
//  Created by Альберт on 09.11.2020.
//

import UIKit
//
//class PostsCollectionView: UICollectionView {
//
////    var cells = [Post]()
//
//     init() {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        super.init(frame: .zero, collectionViewLayout: layout)
//
//        backgroundColor = .blue
//        delegate = self
//        dataSource = self
//        register(PostsCollectionViewCell.self, forCellWithReuseIdentifier: PostsCollectionViewCell.reuseId)
//
//        translatesAutoresizingMaskIntoConstraints = false
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}
//
//extension PostsCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = dequeueReusableCell(withReuseIdentifier: PostsCollectionViewCell.reuseId, for: indexPath)
//        cell.backgroundColor = .yellow
//        cell.layer.cornerRadius = 20
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 300, height: 300)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        switch (indexPath.row) {
//        case 0:
//            print("Budanov")
//        case 1:
//            print("idi")
//        default:
//            print("spatb")
//        }
////        print("click \(indexPath.row)")
//    }
//
//}

//
//  PhotosPresenter.swift
//  List
//
//  Created by Альберт on 27.11.2020.
//

import Foundation
import UIKit

class PhotosPresenter: PhotosPresenterInputProtocol {
    
    
    
   weak var view: PhotosPresenterOutputProtocol?
    var apiManager: APIManager = APIManagerImpl()
    

    var photos: [Photos] = [Photos]()
    
    required init(view: PhotosPresenterOutputProtocol, apiManager: APIManager) {
        self.view = view
        self.apiManager = apiManager
        getComments()

    }
    func getComments() {
            apiManager.fetchPhotos().done { [weak self] (photos) in
                guard let strongSelf = self else { return }
                strongSelf.photos = photos
                let items = strongSelf.photos.compactMap { (photos) -> PhotosCollectionViewCell.PhotosData in
                    let item = PhotosCollectionViewCell.PhotosData.init(albumId: "Album Id: \(photos.albumId ?? 0)",
                                                                       id: "Id: \(photos.id ?? 0)",
                                                                       title: "Title: \( photos.title ?? "")",
                                                                       url: "\(photos.url ?? "")",
                                                                       thumbnailUrl: "thumbnailUrl:  \(photos.thumbnailUrl ?? "")")
                                                                
                    return item
                }
                self?.view?.update(items: items)
 
            }.catch { (error) in
                if let error = error as? APIError{
                    print(error.message)                 
                }
                print(error)
            }
        }
    }

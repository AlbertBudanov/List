//
//  DetailViewController.swift
//  List
//
//  Created by Альберт on 09.11.2020.
//

import UIKit

class DetailViewController: UIViewController {

    
    var idLabel = UILabel()
    var id: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createLabel()
        idLabel.text = "Id post: " + id!
    }
    

    func createLabel() {
        idLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        idLabel.center = view.center
        self.view.addSubview(idLabel)
        
    }

}

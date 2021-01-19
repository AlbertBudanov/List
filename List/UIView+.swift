//
//  UIView+.swift
//  List
//
//  Created by Альберт on 25.11.2020.
//

import UIKit


extension UIView{
    
    
    public func addSubviewForAutolayout(_ view: UIView){
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
}

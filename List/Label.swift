//
//  Label.swift
//  List
//
//  Created by Альберт on 25.11.2020.
//

import UIKit


final class Label: UILabel{
    
    private var style: Style?
    
    public func apply(style: Style){
        self.style = style
        self.textColor = style.textColor
        self.backgroundColor = style.backgroundColor
        self.numberOfLines = style.numberOfLines
        
    }
}

extension UILabel{
    public struct Style{
        var textColor: UIColor
        var backgroundColor: UIColor
        var numberOfLines: Int
        var lineBreakMode: NSLineBreakMode
        public init(textColor: UIColor, backgroundColor: UIColor, numberOfLines: Int = 0, lineBreakMode: NSLineBreakMode = .byWordWrapping){
            self.textColor = textColor
            self.backgroundColor = backgroundColor
            self.numberOfLines = numberOfLines
            self.lineBreakMode = lineBreakMode
        }
    }
}

extension Label.Style {
    public static var `default`: Self = .init(textColor: .gray, backgroundColor: .white, numberOfLines: 0, lineBreakMode: .byWordWrapping)
}

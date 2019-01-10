//
//  Extensions4UIView.swift
//  MyBook
//
//  Created by Javier Cruz Santiago on 11/11/18.
//  Copyright © 2018 Javier Cruz Santiago. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...)
    {
        var viewsDictionary = [String:UIView]()
        for (index,view) in views.enumerated()
        {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    func addShadow(color: UIColor) {
        self.layer.shadowRadius = 6
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = 0.16
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        
    }
}

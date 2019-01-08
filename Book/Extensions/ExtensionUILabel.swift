//
//  ExtensionUILabel.swift
//  Book
//
//  Created by Javier Cruz Santiago on 1/6/19.
//  Copyright © 2019 Javier Cruz Santiago. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    public static func getCustomLabel (text: String, font: FontType, size: CGFloat, color: UIColor, alignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: font.rawValue, size: size)
        label.textColor = color
        label.textAlignment = alignment
        return label
    }
}

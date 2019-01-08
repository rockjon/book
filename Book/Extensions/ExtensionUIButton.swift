//
//  ExtensionUIButton.swift
//  Book
//
//  Created by Javier Cruz Santiago on 1/5/19.
//  Copyright © 2019 Javier Cruz Santiago. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    public static func getCustomButton (text: String, textColor: UIColor, backgroundColor: UIColor, borderColor: UIColor) -> UIButton {
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.setTitleColor(textColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.borderColor = borderColor.cgColor
        button.layer.borderWidth = 1
        return button
    }
}

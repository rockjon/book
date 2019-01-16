//
//  Utils.swift
//  Book
//
//  Created by Javier Cruz Santiago on 1/16/19.
//  Copyright © 2019 Javier Cruz Santiago. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    static func showAlert(title: String, message: String, context: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                break
            case .cancel:
                print("cancel")
                break
            case .destructive:
                print("destructive")
                break
                
            }}))
        context.present(alert, animated: true, completion: nil)
    }
    
    static func showAlertWithAction(title: String, message: String, context: UIViewController, action: UIAlertAction) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(action)
        context.present(alert, animated: true, completion: nil)
    }
}

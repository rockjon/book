//
//  ExtensionsUIViewController.swift
//  MyBook
//
//  Created by Javier Cruz Santiago on 12/10/18.
//  Copyright © 2018 Javier Cruz Santiago. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    func createView(){}
    func addViews(){}
    func setupLayout(){}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        addViews()
        setupLayout()
    }
}

//MARK: Dismissing Keyboard
extension BaseViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}

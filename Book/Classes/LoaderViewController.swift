//
//  LoaderViewController.swift
//  Book
//
//  Created by Javier Cruz Santiago on 1/6/19.
//  Copyright © 2019 Javier Cruz Santiago. All rights reserved.
//

import Foundation
import UIKit
import Lottie
import Alamofire

public enum LoadInfoType {
    case Author
    case Authors
    case Book
    case Books
    case Activity
    case Activities
}

class LoaderViewController: BaseViewController {
    //MARK: Logic Vars
    weak var delegate: LoaderViewControllerDelegate?
    var context: BaseViewController!
    var infoType: LoadInfoType!
    var httpMethod: HTTPMethod!
    let animationDuration: TimeInterval = 1
    
    //MARK: DataSources
    var dataSource: Any?
    var arrayDataSource: [Any]?
    
    //MARK: UI Elements
    var animation: LOTAnimationView! = LOTAnimationView()
    
    //MARK: Create View
    override func createView() {
        view.backgroundColor = .clear
        
        animation.loopAnimation = true
        animation.contentMode = .scaleAspectFit
        animation.isHidden = true
    }
    
    //MARK: Adding Views
    override func addViews() {
        view.addSubview(animation)
    }
    
    //MARK: Setup Layout
    override func setupLayout() {
        animation.frame = view.frame
    }
    
    //MARK: Life Cycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: animationDuration, animations: {
            self.view.backgroundColor = UIColor.white.withAlphaComponent(0.90)
        }) { (animated) in
            self.makeRequest(method: .get, returnType: self.infoType)
        }
        UIView.transition(with: animation, duration: animationDuration, options: .transitionCrossDissolve, animations: {
            self.animation.isHidden = false
        }) { (animated) in
            self.animation.play()
        }
    }
}

//MARK: SetUp Functions
extension LoaderViewController {
    func setInfo (method: HTTPMethod, type: LoadInfoType) {
        httpMethod = method
        infoType = type
        
        if infoType == .Authors || infoType == .Author{
            animation.setAnimation(named: "Working")
        }
        if infoType == .Books || infoType == .Book {
            animation.setAnimation(named: "Shining-Books")
        }
        if infoType == .Activities || infoType == .Activity {
            animation.setAnimation(named: "Dino-Dance")
        }
    }
}

//MARK: Get Data Source
extension LoaderViewController {
    func getDataSource () -> Any? {
        return dataSource
    }
    
    func getArrayDataSource () -> [Any]? {
        return arrayDataSource
    }
}

//MARK: Connection Logic
extension LoaderViewController {
    func makeRequest(method: HTTPMethod, returnType: LoadInfoType) {
        if method == .get {
            ConnectionManager.getArray(of: returnType) { (array) in
                if array != nil {
                    self.arrayDataSource = array
                    self.prepareAndDismiss()
                } else {
                    Utils.showAlertWithAction(title: "Ups", message: "Hubo un error al cargar los datos :C", context: self, action: UIAlertAction(title: "Ok :c", style: UIAlertAction.Style.default, handler: { (alert) in
                        self.prepareAndDismiss()
                    }))
                }
            }
        }
    }
}

//MARK: Animations Management
extension LoaderViewController {
    func prepareAndDismiss () {
        animation.stop()
        UIView.transition(with: animation, duration: animationDuration, options: .transitionCrossDissolve, animations: {
            self.animation.isHidden = true
        }, completion: nil)
        UIView.animate(withDuration: animationDuration, animations: {
            self.view.backgroundColor = .clear
        }) { (animated) in
            self.delegate?.dismissView(animated: true)
        }
    }
}

//MARK: Delegate
protocol LoaderViewControllerDelegate: class {
    func dismissView(animated: Bool)
}

//
//  CreateBookViewController.swift
//  Book
//
//  Created by Javier Cruz Santiago on 1/9/19.
//  Copyright © 2019 Javier Cruz Santiago. All rights reserved.
//

import Foundation
import UIKit

class CreateBookViewController: BaseViewController {
    weak var delegate: CreateElementViewDelegate?
    
    var contentView: UIView!
    var buttonDismiss: UIButton!
    var buttonAccept: UIButton!
    
    //MARK: Create View
    override func createView() {
        view.backgroundColor = .clear
        
        contentView = UIView()
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
        
        buttonDismiss = UIButton()
        buttonDismiss.setTitle("Dimiss View", for: .normal)
        buttonDismiss.setTitleColor(.white, for: .normal)
        buttonDismiss.backgroundColor = .red
        buttonDismiss.layer.cornerRadius = 20
        buttonDismiss.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        
        buttonAccept = UIButton()
        buttonAccept.setTitle("Aceptar", for: .normal)
        buttonAccept.setTitleColor(.white, for: .normal)
        buttonAccept.backgroundColor = .OLIVA
        buttonAccept.layer.cornerRadius = 20
        buttonAccept.addTarget(self, action: #selector(accept), for: .touchUpInside)

    }
    override func addViews() {
        view.addSubview(contentView)
        contentView.addSubview(buttonDismiss)
        contentView.addSubview(buttonAccept)
    }
    override func setupLayout() {
//        contentView.frame = CGRect(x: 20, y: UIApplication.shared.statusBarFrame.height + 20, width: view.frame.width - 40, height: view.frame.height - (UIApplication.shared.statusBarFrame.height + 40))
        view.addConstraintsWithFormat(format: "V:|-40-[v0]-40-|", views: contentView)
        view.addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: contentView)
        
        contentView.addConstraintsWithFormat(format: "V:|[v0(40)]", views: buttonDismiss)
        contentView.addConstraintsWithFormat(format: "H:|[v0]|", views: buttonDismiss)
        
        contentView.addConstraintsWithFormat(format: "V:[v0(40)]|", views: buttonAccept)
        contentView.addConstraintsWithFormat(format: "H:|[v0]|", views: buttonAccept)
    }
    
    //MARK: LifeCycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1) {
            self.view.backgroundColor = .TRANSPARENT_BLACK
        }
    }
}

//MARK: UIElementActions
extension CreateBookViewController {
    @objc func cancel() {
        prepareViewAndDismiss()
    }
    
    @objc func accept() {
        print("Making request for add a new book")
        print("OK")
        prepareViewAndDismiss()
    }
}

//MARK: Preparing View For Dismiss
extension CreateBookViewController {
    func prepareViewAndDismiss() {
        UIView.animate(withDuration: 1, animations: {
            self.view.backgroundColor = .clear
        }) { (animated) in
            self.delegate?.dismissView()
        }
    }
}

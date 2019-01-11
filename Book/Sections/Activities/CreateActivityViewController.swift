//
//  CreateActivityViewController.swift
//  Book
//
//  Created by Jonathan Hernandez on 1/10/19.
//  Copyright © 2019 Javier Cruz Santiago. All rights reserved.
//

import UIKit

class CreateActivityViewController: BaseViewController {
    
    weak var delegate: CreateElementViewDelegate?
    
    var contentView: UIView!
    var buttonDismiss: UIButton!
    var buttonAccept: UIButton!
    var labelTitle : UILabel!
    var fieldTitle : UITextField!
    var labelEndDate :UILabel!
    var fieldEndDate : UITextField!
    
    override func createView(){
        contentView = UIView()
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
        
        buttonDismiss = UIButton()
        buttonDismiss.setImage(UIImage(imageLiteralResourceName: "deleteBtn"), for: .normal)
        buttonDismiss.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        
        buttonAccept = UIButton()
        buttonAccept.setTitle("Aceptar", for: .normal)
        buttonAccept.setTitleColor(.white, for: .normal)
        buttonAccept.backgroundColor = .OLIVA
        buttonAccept.layer.cornerRadius = 20
        buttonAccept.addTarget(self, action: #selector(accept), for: .touchUpInside)
        
        labelTitle = UILabel.getCustomLabel(text: "Title", font: .Regular, size: 16, color: UIColor.FONT_COLOR, alignment: .left)
        
        fieldTitle = UITextField()
        fieldTitle.layer.cornerRadius = 3;
        fieldTitle.layer.borderWidth = 1;
        fieldTitle.layer.borderColor = UIColor.GRAY_STRONG.cgColor
        fieldTitle.frame.size.height = 20
        
        labelEndDate = UILabel.getCustomLabel(text: "End Date", font: .Regular, size: 16, color: UIColor.FONT_COLOR, alignment: .left)
        
        fieldEndDate = UITextField()
        fieldEndDate.layer.cornerRadius = 3;
        fieldEndDate.layer.borderWidth = 1;
        fieldEndDate.layer.borderColor = UIColor.GRAY_STRONG.cgColor
        fieldEndDate.frame.size.height = 20
    }
    
    override func addViews(){
        view.addSubview(contentView)
        contentView.addSubview(buttonDismiss)
        contentView.addSubview(buttonAccept)
        contentView.addSubview(labelTitle)
        contentView.addSubview(fieldTitle)
        contentView.addSubview(labelEndDate)
        contentView.addSubview(fieldEndDate)
    }
    
    override func setupLayout(){
        
        view.addConstraintsWithFormat(format: "V:|-(\((self.view.frame.height/2)-110))-[v0(==220)]", views: contentView)
        view.addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: contentView)
        
        contentView.addConstraintsWithFormat(format: "V:|-(-20)-[v0(40)]", views: buttonDismiss)
        contentView.addConstraintsWithFormat(format: "H:[v0]-(-10)-|", views: buttonDismiss)
        
        contentView.addConstraintsWithFormat(format: "V:[v0(40)]|", views: buttonAccept)
        contentView.addConstraintsWithFormat(format: "H:|[v0]|", views: buttonAccept)
        
        contentView.addConstraintsWithFormat(format: "V:|-16-[v0]", views: labelTitle)
        contentView.addConstraintsWithFormat(format: "H:|-14-[v0]", views: labelTitle)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-2-[v1(30)]", views: labelTitle,fieldTitle)
        contentView.addConstraintsWithFormat(format: "H:|-14-[v0]-14-|", views: fieldTitle)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-12-[v1]", views: fieldTitle,labelEndDate)
        contentView.addConstraintsWithFormat(format: "H:|-14-[v0]", views: labelEndDate)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-2-[v1(30)]", views: labelEndDate,fieldEndDate)
        contentView.addConstraintsWithFormat(format: "H:|-14-[v0]-14-|", views: fieldEndDate)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1) {
            self.view.backgroundColor = .TRANSPARENT_BLACK
        }
    }

}

//MARK: UIElementActions
extension CreateActivityViewController {
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
extension CreateActivityViewController {
    func prepareViewAndDismiss() {
        UIView.animate(withDuration: 1, animations: {
            self.view.backgroundColor = .clear
        }) { (animated) in
            self.delegate?.dismissView()
        }
    }
}

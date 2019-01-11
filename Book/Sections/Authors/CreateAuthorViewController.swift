//
//  CreateAuthorViewController.swift
//  Book
//
//  Created by Jonathan Hernandez on 1/10/19.
//  Copyright © 2019 Javier Cruz Santiago. All rights reserved.
//

import UIKit

class CreateAuthorViewController: BaseViewController {

    weak var delegate: CreateElementViewDelegate?
    
    var contentView: UIView!
    var buttonDismiss: UIButton!
    var buttonAccept: UIButton!
    var labelFirstName : UILabel!
    var fieldFirstName : UITextField!
    var labelLastName :UILabel!
    var fieldLastName : UITextField!
    var labelIDBook :UILabel!
    var fieldIDBook: UITextField!
    
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
        
        labelFirstName = UILabel.getCustomLabel(text: "First Name", font: .Regular, size: 16, color: UIColor.FONT_COLOR, alignment: .left)
        
        fieldFirstName = UITextField()
        fieldFirstName.layer.cornerRadius = 3;
        fieldFirstName.layer.borderWidth = 1;
        fieldFirstName.layer.borderColor = UIColor.GRAY_STRONG.cgColor
        fieldFirstName.frame.size.height = 20
        
        labelLastName = UILabel.getCustomLabel(text: "Last Name", font: .Regular, size: 16, color: UIColor.FONT_COLOR, alignment: .left)
        
        fieldLastName = UITextField()
        fieldLastName.layer.cornerRadius = 3;
        fieldLastName.layer.borderWidth = 1;
        fieldLastName.layer.borderColor = UIColor.GRAY_STRONG.cgColor
        fieldLastName.frame.size.height = 20
        
        labelIDBook = UILabel.getCustomLabel(text: "Book Published", font: .Regular, size: 16, color: UIColor.FONT_COLOR, alignment: .left)
        
        fieldIDBook = UITextField()
        fieldIDBook.layer.cornerRadius = 3;
        fieldIDBook.layer.borderWidth = 1;
        fieldIDBook.layer.borderColor = UIColor.GRAY_STRONG.cgColor
        fieldIDBook.frame.size.height = 20
    }
    
    override func addViews(){
        view.addSubview(contentView)
        contentView.addSubview(buttonDismiss)
        contentView.addSubview(buttonAccept)
        contentView.addSubview(labelFirstName)
        contentView.addSubview(fieldFirstName)
        contentView.addSubview(labelLastName)
        contentView.addSubview(fieldLastName)
        contentView.addSubview(labelIDBook)
        contentView.addSubview(fieldIDBook)
    }
    
    override func setupLayout(){
        
        view.addConstraintsWithFormat(format: "V:|-(\((self.view.frame.height/2)-110))-[v0(==260)]", views: contentView)
        view.addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: contentView)
        
        contentView.addConstraintsWithFormat(format: "V:|-(-20)-[v0(40)]", views: buttonDismiss)
        contentView.addConstraintsWithFormat(format: "H:[v0]-(-10)-|", views: buttonDismiss)
        
        contentView.addConstraintsWithFormat(format: "V:[v0(40)]|", views: buttonAccept)
        contentView.addConstraintsWithFormat(format: "H:|[v0]|", views: buttonAccept)
        
        contentView.addConstraintsWithFormat(format: "V:|-16-[v0]", views: labelFirstName)
        contentView.addConstraintsWithFormat(format: "H:|-14-[v0]", views: labelFirstName)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-2-[v1(30)]", views: labelFirstName,fieldFirstName)
        contentView.addConstraintsWithFormat(format: "H:|-14-[v0]-14-|", views: fieldFirstName)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-12-[v1]", views: fieldFirstName,labelLastName)
        contentView.addConstraintsWithFormat(format: "H:|-14-[v0]", views: labelLastName)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-2-[v1(30)]", views: labelLastName,fieldLastName)
        contentView.addConstraintsWithFormat(format: "H:|-14-[v0]-14-|", views: fieldLastName)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-12-[v1]", views: fieldLastName,labelIDBook)
        contentView.addConstraintsWithFormat(format: "H:|-14-[v0]", views: labelIDBook)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-2-[v1(30)]", views: labelIDBook,fieldIDBook)
        contentView.addConstraintsWithFormat(format: "H:|-14-[v0(50)]", views: fieldIDBook)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1) {
            self.view.backgroundColor = .TRANSPARENT_BLACK
        }
    }

}

//MARK: UIElementActions
extension CreateAuthorViewController {
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
extension CreateAuthorViewController {
    func prepareViewAndDismiss() {
        UIView.animate(withDuration: 1, animations: {
            self.view.backgroundColor = .clear
        }) { (animated) in
            self.delegate?.dismissView()
        }
    }
}

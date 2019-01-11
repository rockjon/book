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
    var imageViewBookCover: UIImageView!
    var buttonCancel: UIButton!
    var labelTitle: UILabel!
    var textFieldTitle: UITextField!
    var labelAuthor: UILabel!
    var textFieldAuthor: UITextField!
    var labelPublished: UILabel!
    var textFieldPublished: UITextField!
    var labelPages: UILabel!
    var textFieldPages: UITextField!
    var labelDescription: UILabel!
    var textViewDescription: UITextView!
    var labelAbstract: UILabel!
    var textViewAbstract: UITextView!
    var buttonAccept: UIButton!
    
    //MARK: Create View
    override func createView() {
        view.backgroundColor = .clear
        
        contentView = UIView()
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
        
        buttonCancel = UIButton()
        buttonCancel.setImage(UIImage(named: "deleteBtn"), for: .normal)
        buttonCancel.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        
        imageViewBookCover = UIImageView()
        imageViewBookCover.backgroundColor = UIColor.GRAY
        imageViewBookCover.layer.cornerRadius = 10
        imageViewBookCover.contentMode = .scaleToFill
        
        labelTitle = UILabel.getCustomLabel(text: "Título:", font: .Bold, size: 15, color: .GRAY, alignment: .left)
        
        textFieldTitle = UITextField()
        textFieldTitle.text = "Book Title"
        textFieldTitle.layer.cornerRadius = 3
        textFieldTitle.layer.borderColor = UIColor.GRAY.cgColor
        textFieldTitle.layer.borderWidth = 0.5
        textFieldTitle.font = UIFont(name: FontType.Regular.rawValue, size: 15)
        textFieldTitle.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))
        textFieldTitle.leftViewMode = .always
        textFieldTitle.delegate = self
        
        labelAuthor = UILabel.getCustomLabel(text: "Autor", font: .Bold, size: 15, color: .GRAY, alignment: .left)
        
        textFieldAuthor = UITextField()
        textFieldAuthor.text = "Book Author"
        textFieldAuthor.layer.cornerRadius = 3
        textFieldAuthor.layer.borderColor = UIColor.GRAY.cgColor
        textFieldAuthor.layer.borderWidth = 0.5
        textFieldAuthor.font = UIFont(name: FontType.Regular.rawValue, size: 15)
        textFieldAuthor.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))
        textFieldAuthor.leftViewMode = .always
        textFieldAuthor.delegate = self
        
        labelPublished = UILabel.getCustomLabel(text: "Fecha de Publicación:", font: .Bold, size: 15, color: .GRAY, alignment: .left)
        
        textFieldPublished = UITextField()
        textFieldPublished.text = "Published Date"
        textFieldPublished.layer.cornerRadius = 3
        textFieldPublished.layer.borderColor = UIColor.GRAY.cgColor
        textFieldPublished.layer.borderWidth = 0.5
        textFieldPublished.font = UIFont(name: FontType.Regular.rawValue, size: 15)
        textFieldPublished.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))
        textFieldPublished.leftViewMode = .always
        textFieldPublished.delegate = self
        
        labelPages = UILabel.getCustomLabel(text: "Páginas", font: .Bold, size: 15, color: .GRAY, alignment: .left)
        
        textFieldPages = UITextField()
        textFieldPages.text = "Book Pages"
        textFieldPages.layer.cornerRadius = 3
        textFieldPages.layer.borderColor = UIColor.GRAY.cgColor
        textFieldPages.layer.borderWidth = 0.5
        textFieldPages.font = UIFont(name: FontType.Regular.rawValue, size: 15)
        textFieldPages.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))
        textFieldPages.leftViewMode = .always
        textFieldPages.keyboardType = .numberPad
        textFieldPages.delegate = self
        
        labelDescription = UILabel.getCustomLabel(text: "Descripción:", font: .Bold, size: 15, color: .GRAY, alignment: .left)
        
        textViewDescription = UITextView()
        textViewDescription.text = "Book Description"
        textViewDescription.layer.cornerRadius = 3
        textViewDescription.layer.borderColor = UIColor.GRAY.cgColor
        textViewDescription.layer.borderWidth = 0.5
        textViewDescription.font = UIFont(name: FontType.Regular.rawValue, size: 15)
        textViewDescription.delegate = self
        
        labelAbstract = UILabel.getCustomLabel(text: "Resumen", font: .Bold, size: 15, color: .GRAY, alignment: .left)
        
        textViewAbstract = UITextView()
        textViewAbstract.text = "Book Abstract"
        textViewAbstract.layer.cornerRadius = 3
        textViewAbstract.layer.borderColor = UIColor.GRAY.cgColor
        textViewAbstract.layer.borderWidth = 0.5
        textViewAbstract.font = UIFont(name: FontType.Regular.rawValue, size: 15)
        textViewAbstract.delegate = self
        
        buttonAccept = UIButton()
        buttonAccept.setTitle("Aceptar", for: .normal)
        buttonAccept.setTitleColor(.white, for: .normal)
        buttonAccept.backgroundColor = .OLIVA
        buttonAccept.layer.cornerRadius = 20
        buttonAccept.addTarget(self, action: #selector(accept), for: .touchUpInside)

    }
    override func addViews() {
        view.addSubview(contentView)
        contentView.addSubview(buttonCancel)
        contentView.addSubview(imageViewBookCover)
        contentView.addSubview(labelTitle)
        contentView.addSubview(textFieldTitle)
        contentView.addSubview(labelAuthor)
        contentView.addSubview(textFieldAuthor)
        contentView.addSubview(labelPublished)
        contentView.addSubview(textFieldPublished)
        contentView.addSubview(labelPages)
        contentView.addSubview(textFieldPages)
        contentView.addSubview(labelDescription)
        contentView.addSubview(textViewDescription)
        contentView.addSubview(labelAbstract)
        contentView.addSubview(textViewAbstract)
        contentView.addSubview(buttonAccept)
    }
    override func setupLayout() {
        contentView.frame = CGRect(x: 10, y: (view.frame.height - 550) / 2, width: view.frame.width - 20, height: 550)
        
        contentView.addConstraintsWithFormat(format: "V:|-10-[v0(30)]", views: buttonCancel)
        contentView.addConstraintsWithFormat(format: "H:[v0(30)]-10-|", views: buttonCancel)
        
        contentView.addConstraintsWithFormat(format: "V:|-10-[v0(120)]", views: imageViewBookCover)
        contentView.addConstraintsWithFormat(format: "H:|-10-[v0(110)]", views: imageViewBookCover)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-15-[v1(20)]", views: imageViewBookCover,labelTitle)
        contentView.addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: labelTitle)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-5-[v1(20)]", views: labelTitle,textFieldTitle)
        contentView.addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: textFieldTitle)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-10-[v1(20)]", views: textFieldTitle,labelAuthor)
        contentView.addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: labelAuthor)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-5-[v1(20)]", views: labelAuthor,textFieldAuthor)
        contentView.addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: textFieldAuthor)
        
        let width = (contentView.frame.width - 30) / 2
        contentView.addConstraintsWithFormat(format: "V:[v0]-10-[v1(20)]", views: textFieldAuthor,labelPublished)
        contentView.addConstraintsWithFormat(format: "V:[v0]-10-[v1(20)]", views: textFieldAuthor,labelPages)
        contentView.addConstraintsWithFormat(format: "H:|-10-[v0(\(width))]", views: labelPublished)
        contentView.addConstraintsWithFormat(format: "H:[v0(\(width))]-10-|", views: labelPages)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-5-[v1(20)]", views: labelPublished,textFieldPublished)
        contentView.addConstraintsWithFormat(format: "V:[v0]-5-[v1(20)]", views: labelPages,textFieldPages)
        contentView.addConstraintsWithFormat(format: "H:|-10-[v0(\(width))]", views: textFieldPublished)
        contentView.addConstraintsWithFormat(format: "H:[v0(\(width))]-10-|", views: textFieldPages)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-10-[v1(20)]", views: textFieldPublished,labelDescription)
        contentView.addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: labelDescription)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-5-[v1(60)]", views: labelDescription,textViewDescription)
        contentView.addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: textViewDescription)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-10-[v1(20)]", views: textViewDescription,labelAbstract)
        contentView.addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: labelAbstract)
        
        contentView.addConstraintsWithFormat(format: "V:[v0]-5-[v1(60)]", views: labelAbstract,textViewAbstract)
        contentView.addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: textViewAbstract)
        
        buttonAccept.frame = CGRect(x: 0, y: contentView.frame.height - 50, width: contentView.frame.width, height: 50)
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

//MARK: TextFieldDelegate Management
extension CreateBookViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: TextviewDelegate Management
extension CreateBookViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
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

//
//  AuthorTableViewCell.swift
//  Book
//
//  Created by Javier Cruz Santiago on 1/6/19.
//  Copyright © 2019 Javier Cruz Santiago. All rights reserved.
//

import Foundation
import UIKit

class AuthorTableViewCell: UITableViewCell {
    public static let ID = "AuthorTableViewCellId"
    
    var imageAuthor: UIImageView!
    var labelFirstName: UILabel!
    var labelAuthorFirstName: UILabel!
    var labelLastName: UILabel!
    var labelAuthorLastName: UILabel!
    var labelBooks: UILabel!
    var labelAuthorBooks: UILabel!
    var buttonMessage: UIButton!
    var buttonContacts: UIButton!
    var buttonNotifications: UIButton!
    var bottomView: UIView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //MARK: Create View
        imageAuthor = UIImageView(image: UIImage(named: "photoAuthor"))
        imageAuthor.frame.size = CGSize(width: 60, height: 60)
        
        labelFirstName = UILabel.getCustomLabel(text: "Nombre:", font: .Bold, size: 15, color: .FONT_COLOR, alignment: .left)
        labelAuthorFirstName = UILabel.getCustomLabel(text: "AuthorFirstName", font: .Regular, size: 15, color: .FONT_COLOR, alignment: .right)
        
        labelLastName = UILabel.getCustomLabel(text: "Apellidos:", font: .Bold, size: 15, color: .FONT_COLOR, alignment: .left)
        labelAuthorLastName = UILabel.getCustomLabel(text: "AuthorLastName", font: .Regular, size: 15, color: .FONT_COLOR, alignment: .right)
        
        labelBooks = UILabel.getCustomLabel(text: "Libros:", font: .Bold, size: 15, color: .FONT_COLOR, alignment: .left)
        labelAuthorBooks = UILabel.getCustomLabel(text: "Book1,Book2,Book3", font: .Regular, size: 15, color: .FONT_COLOR, alignment: .right)
        
        buttonMessage = UIButton()
        buttonMessage.setImage(UIImage(named: "icMessageY"), for: .normal)
        
        buttonContacts = UIButton()
        buttonContacts.setImage(UIImage(named: "icBookY"), for: .normal)
        
        buttonNotifications = UIButton()
        buttonNotifications.setImage(UIImage(named: "icNotificationsY"), for: .normal)
        
        bottomView = UIView()
        bottomView.backgroundColor = UIColor.GRAY
        
        //MARK: Adding Views
        addSubview(imageAuthor)
        
        addSubview(labelFirstName)
        addSubview(labelAuthorFirstName)
        addSubview(labelLastName)
        addSubview(labelAuthorLastName)
        addSubview(labelBooks)
        addSubview(labelAuthorBooks)
        
        addSubview(buttonMessage)
        addSubview(buttonContacts)
        addSubview(buttonNotifications)
        
        addSubview(bottomView)
        
        //MARK: SetUp Layout
        addConstraintsWithFormat(format: "V:|-10-[v0(60)]", views: imageAuthor)
        addConstraintsWithFormat(format: "H:|-10-[v0(60)]", views: imageAuthor)
        
        addConstraintsWithFormat(format: "V:|[v0]|", views: buttonMessage)
        addConstraintsWithFormat(format: "V:|[v0]|", views: buttonContacts)
        addConstraintsWithFormat(format: "V:|[v0]|", views: buttonNotifications)
        addConstraintsWithFormat(format: "H:[v0(25)]-5-[v1(25)]-5-[v2(20)]-10-|", views: buttonMessage,buttonContacts,buttonNotifications)
        
        addConstraintsWithFormat(format: "V:|-12.5-[v0(20)][v1(20)][v2(20)]", views: labelFirstName,labelLastName,labelBooks)
        addConstraintsWithFormat(format: "V:|-12.5-[v0(20)][v1(20)][v2(20)]", views: labelAuthorFirstName,labelAuthorLastName,labelAuthorBooks)
        addConstraintsWithFormat(format: "H:[v0]-10-[v1(70)][v2]-10-[v3]", views: imageAuthor,labelFirstName,labelAuthorFirstName,buttonMessage)
        addConstraintsWithFormat(format: "H:[v0]-10-[v1(70)][v2]-10-[v3]", views: imageAuthor,labelLastName,labelAuthorLastName,buttonMessage)
        addConstraintsWithFormat(format: "H:[v0]-10-[v1(50)][v2]-10-[v3]", views: imageAuthor,labelBooks,labelAuthorBooks,buttonMessage)
        
        addConstraintsWithFormat(format: "V:[v0(1)]|", views: bottomView)
        addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: bottomView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

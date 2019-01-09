//
//  BookTableViewCell.swift
//  MyBook
//
//  Created by Javier Cruz Santiago on 1/3/19.
//  Copyright © 2019 Javier Cruz Santiago. All rights reserved.
//

import Foundation
import UIKit

class BookTableViewCell: UITableViewCell {
    public static let ID = "BookTableViewCellId"
    
    var infoView: UIView!
    var imageBookCover: UIImageView!
    var labelBookTitle: UILabel!
    var bookStars: Stars!
    var labelAuthor: UILabel!
    var labelBookAuthor: UILabel!
    var labelPublished: UILabel!
    var labelBookPublished: UILabel!
    var labelPages: UILabel!
    var labelBookPages: UILabel!
    var buttonSeeMore: UIButton!
    var labelDescription: UILabel!
    var textViewDescription: UITextView!
    var labelAbstract: UILabel!
    var textViewAbstract: UITextView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        infoView = UIView()
        infoView.backgroundColor = .white
        infoView.layer.cornerRadius = 10
        infoView.addShadow(color: .black)
        
        contentView.addSubview(infoView)
        
        imageBookCover = UIImageView(frame: CGRect(x: 0, y: 0, width: 140, height: 170))
        imageBookCover.backgroundColor = .lightGray
        labelBookTitle = UILabel.getCustomLabel(text: "Book Title", font: .Bold, size: 24, color: .FONT_COLOR, alignment: .left)
        bookStars = Stars(frame: CGRect(x: 150, y: 40, width: 125, height: 15))
        labelAuthor = UILabel.getCustomLabel(text: "Autor:", font: .Bold, size: 16, color: .FONT_COLOR, alignment: .left)
        labelBookAuthor = UILabel.getCustomLabel(text: "BookAuthor", font: .Regular, size: 16, color: .FONT_COLOR, alignment: .right)
        labelPublished = UILabel.getCustomLabel(text: "Publicado:", font: .Bold, size: 16, color: .FONT_COLOR, alignment: .left)
        labelBookPublished = UILabel.getCustomLabel(text: "Published", font: .Regular, size: 16, color: .FONT_COLOR, alignment: .right)
        labelPages = UILabel.getCustomLabel(text: "Páginas:", font: .Bold, size: 16, color: .FONT_COLOR, alignment: .left)
        labelBookPages = UILabel.getCustomLabel(text: "NumberOfPages", font: .Regular, size: 16, color: .FONT_COLOR, alignment: .right)
        
        buttonSeeMore = UIButton()
        buttonSeeMore.setImage(UIImage(named: "icDetailDown"), for: .normal)
        
        labelDescription = UILabel.getCustomLabel(text: "Descripción", font: .Bold, size: 16, color: .FONT_COLOR, alignment: .left)
        labelDescription.isHidden = true
        
        textViewDescription = UITextView()
        textViewDescription.font = UIFont(name: FontType.Regular.rawValue, size: 12)
        textViewDescription.isEditable = false
        textViewDescription.isHidden = true
        
        labelAbstract = UILabel.getCustomLabel(text: "Abstracción", font: .Bold, size: 16, color: .FONT_COLOR, alignment: .left)
        labelAbstract.isHidden = true
        
        textViewAbstract = UITextView()
        textViewAbstract.font = UIFont(name: FontType.Regular.rawValue, size: 12)
        textViewAbstract.isEditable = false
        textViewAbstract.isHidden = true
        
        infoView.addSubview(imageBookCover)
        infoView.addSubview(labelBookTitle)
        infoView.addSubview(bookStars)
        infoView.addSubview(labelAuthor)
        infoView.addSubview(labelBookAuthor)
        infoView.addSubview(labelPublished)
        infoView.addSubview(labelBookPublished)
        infoView.addSubview(labelPages)
        infoView.addSubview(labelBookPages)
        infoView.addSubview(buttonSeeMore)
        infoView.addSubview(labelDescription)
        infoView.addSubview(textViewDescription)
        infoView.addSubview(labelAbstract)
        infoView.addSubview(textViewAbstract)
        
        infoView.addConstraintsWithFormat(format: "V:|-10-[v0(30)]", views: labelBookTitle)
        infoView.addConstraintsWithFormat(format: "H:|-150-[v0]-10-|", views: labelBookTitle)
        
        infoView.addConstraintsWithFormat(format: "V:[v0]-5-[v1(\(bookStars.frame.height))]", views: labelBookTitle,bookStars)
        infoView.addConstraintsWithFormat(format: "H:|-150-[v0(\(bookStars.frame.width))]", views: bookStars)
        
        infoView.addConstraintsWithFormat(format: "V:[v0]-10-[v1]", views: bookStars,labelAuthor)
        infoView.addConstraintsWithFormat(format: "H:|-150-[v0]-10-|", views: labelAuthor)
        
        infoView.addConstraintsWithFormat(format: "V:[v0]-10-[v1]", views: bookStars,labelBookAuthor)
        infoView.addConstraintsWithFormat(format: "H:|-150-[v0]-10-|", views: labelBookAuthor)
        
        infoView.addConstraintsWithFormat(format: "V:[v0]-5-[v1]", views: labelAuthor,labelPublished)
        infoView.addConstraintsWithFormat(format: "H:|-150-[v0]-10-|", views: labelPublished)
        
        infoView.addConstraintsWithFormat(format: "V:[v0]-5-[v1]", views: labelAuthor,labelBookPublished)
        infoView.addConstraintsWithFormat(format: "H:|-150-[v0]-10-|", views: labelBookPublished)
        
        infoView.addConstraintsWithFormat(format: "V:[v0]-5-[v1]", views: labelPublished,labelPages)
        infoView.addConstraintsWithFormat(format: "H:|-150-[v0]-10-|", views: labelPages)
        
        infoView.addConstraintsWithFormat(format: "V:[v0]-5-[v1]", views: labelPublished,labelBookPages)
        infoView.addConstraintsWithFormat(format: "H:|-150-[v0]-10-|", views: labelBookPages)
        
        infoView.addConstraintsWithFormat(format: "V:[v0][v1(30)]", views: labelBookPages,buttonSeeMore)
        infoView.addConstraintsWithFormat(format: "H:[v0(40)]|", views: buttonSeeMore)
        
        infoView.addConstraintsWithFormat(format: "V:|-190-[v0(20)]", views: labelDescription)
        infoView.addConstraintsWithFormat(format: "H:|-15-[v0]-15-|", views: labelDescription)
        
        infoView.addConstraintsWithFormat(format: "V:[v0]-10-[v1(80)]", views: labelDescription,textViewDescription)
        infoView.addConstraintsWithFormat(format: "H:|-15-[v0]-15-|", views: textViewDescription)
        
        infoView.addConstraintsWithFormat(format: "V:[v0]-10-[v1(10)]", views: textViewDescription,labelAbstract)
        infoView.addConstraintsWithFormat(format: "H:|-15-[v0]-15-|", views: labelAbstract)
        
        infoView.addConstraintsWithFormat(format: "V:[v0]-10-[v1(80)]", views: labelAbstract,textViewAbstract)
        infoView.addConstraintsWithFormat(format: "H:|-15-[v0]-15-|", views: textViewAbstract)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Set Cell Data
extension BookTableViewCell {
    func setData (book: BookModel) {
        labelBookTitle.text = book.Title
        labelBookAuthor.text = ""
        labelBookPublished.text = book.PublishDate?.components(separatedBy: "T")[0]
        labelBookPages.text = "\(book.PageCount ?? 0)"
        textViewDescription.text = book.Description
        textViewAbstract.text = book.Excerpt
    }
}

//MARK: Expand and Dismiss Logic
extension BookTableViewCell {
    func hideViews() {
        hideOrShowView(view: labelDescription, hide: true)
        hideOrShowView(view: textViewDescription, hide: true)
        hideOrShowView(view: labelAbstract, hide: true)
        hideOrShowView(view: textViewAbstract, hide: true)
    }
    
    func showViews() {
        hideOrShowView(view: labelDescription, hide: false)
        hideOrShowView(view: textViewDescription, hide: false)
        hideOrShowView(view: labelAbstract, hide: false)
        hideOrShowView(view: textViewAbstract, hide: false)
    }
    
    private func hideOrShowView(view: UIView, hide: Bool) {
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            view.isHidden = hide
        })
    }
}

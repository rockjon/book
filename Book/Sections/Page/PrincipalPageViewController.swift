//
//  PrincipalPageController.swift
//  Book
//
//  Created by Javier Cruz Santiago on 1/5/19.
//  Copyright © 2019 Javier Cruz Santiago. All rights reserved.
//

import Foundation
import UIKit

class PrincipalPageViewController: BaseViewController {
    //MARK: UI Elements
    var topView: UIView!
    var imageViewLogo: UIImageView!
    var buttonSearch: UIButton!
    var labelAuthors: UILabel!
    var buttonAuthors: UIButton!
    var labelBooks: UILabel!
    var buttonBooks: UIButton!
    var labelActivities: UILabel!
    var buttonActivities: UIButton!
    
    var contentViewForAuthors: AuthorsView!
    var contentViewForBooks: BooksView!
    var contentViewForActivities: ActivitiesView!
    
    var bottomView: UIView!
    var imageProfile: UIImageView!
    var labelProfile: UILabel!
    var buttonProfile: UIButton!
    var imageReceived: UIImageView!
    var labelReceived: UILabel!
    var buttonReceived: UIButton!
    var buttonAdd: UIButton!
    
    var buttonAddAuthor: UIButton!
    var labelAddAuthor: UILabel!
    var buttonAddBook: UIButton!
    var labelAddBook: UILabel!
    var buttonAddActivity: UIButton!
    var labelAddActivity: UILabel!
    
    var currentPage: CGFloat! = 0
    let authorsPage: CGFloat = 0
    let booksPage: CGFloat = 1
    let activitiesPage: CGFloat = 2
    
    var isAddMenuVisible: Bool! = false
    
    //MARK: CreateView
    override func createView() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        
        //MARK: TopView Creating
        topView = UIView()
        topView.backgroundColor = UIColor.PRIMARY_COLOR
        topView.addShadow(color: .black)
        
        imageViewLogo = UIImageView(image: UIImage(named: "logoBook"))
        imageViewLogo.contentMode = .scaleAspectFit
        
        labelAuthors = UILabel.getCustomLabel(text: "Autores", font: .Bold, size: 20, color: .white, alignment: .center)
        
        buttonAuthors = UIButton()
        buttonAuthors.addTarget(self, action: #selector(setAuthorsContent), for: .touchUpInside)
        
        labelBooks = UILabel.getCustomLabel(text: "Libros", font: .Bold, size: 20, color: .GRAY, alignment: .center)
        
        buttonBooks = UIButton()
        buttonBooks.addTarget(self, action: #selector(setBooksContent), for: .touchUpInside)
        
        labelActivities = UILabel.getCustomLabel(text: "Actividades", font: .Bold, size: 20, color: .GRAY, alignment: .center)
        
        buttonActivities = UIButton()
        buttonActivities.addTarget(self, action: #selector(setActivitiesContent), for: .touchUpInside)
        
        //MARK: BottomView Creating
        bottomView = UIView()
        bottomView.backgroundColor = UIColor.PRIMARY_COLOR
        bottomView.frame.size = CGSize(width: view.frame.width, height: 50)
        bottomView.addShadow(color: .black)
        
        buttonAdd = UIButton()
        buttonAdd.setImage(UIImage(named: "addBtn"), for: .normal)
        buttonAdd.frame.size = CGSize(width: 60, height: 60)
        buttonAdd.layer.cornerRadius = buttonAdd.frame.height / 2
        buttonAdd.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        
        imageProfile = UIImageView(image: UIImage(named: "icPerson"))
        imageProfile.frame.size = CGSize(width: 20, height: 20)
        imageProfile.contentMode = .scaleAspectFit

        labelProfile = UILabel.getCustomLabel(text: "Perfil", font: .Bold, size: 15, color: .white, alignment: .center)
        
        imageReceived = UIImageView(image: UIImage(named: "icNotify"))
        imageReceived.frame.size = CGSize(width: 20, height: 20)
        imageReceived.contentMode = .scaleAspectFit
        
        labelReceived = UILabel.getCustomLabel(text: "Recibidos", font: .Bold, size: 15, color: .white, alignment: .center)
        
        buttonAddAuthor = UIButton()
        buttonAddAuthor.setImage(UIImage(named: "addAuthor"), for: .normal)
        buttonAddAuthor.addTarget(self, action: #selector(add(sender:)), for: .touchUpInside)
        
        buttonAddBook = UIButton()
        buttonAddBook.setImage(UIImage(named: "addBook"), for: .normal)
        buttonAddBook.addTarget(self, action: #selector(add(sender:)), for: .touchUpInside)
        
        buttonAddActivity = UIButton()
        buttonAddActivity.setImage(UIImage(named: "addActivity"), for: .normal)
        buttonAddActivity.addTarget(self, action: #selector(add(sender:)), for: .touchUpInside)
        
        //MARK: ContentView
        contentViewForAuthors = AuthorsView()
        contentViewForAuthors.setupInfo(context: self)
        
        contentViewForBooks = BooksView()
        contentViewForBooks.setupInfo(context: self)
        
        contentViewForActivities = ActivitiesView()
        contentViewForActivities.setupInfo(context: self)
    }
    override func addViews() {
        view.addSubview(contentViewForAuthors)
        view.addSubview(contentViewForBooks)
        view.addSubview(contentViewForActivities)
        
        view.addSubview(topView)
        topView.addSubview(imageViewLogo)
        topView.addSubview(labelAuthors)
        topView.addSubview(buttonAuthors)
        topView.addSubview(labelBooks)
        topView.addSubview(buttonBooks)
        topView.addSubview(labelActivities)
        topView.addSubview(buttonActivities)
        
        view.addSubview(buttonAddAuthor)
        view.addSubview(buttonAddBook)
        view.addSubview(buttonAddActivity)
        view.addSubview(bottomView)
        bottomView.addSubview(imageProfile)
        bottomView.addSubview(labelProfile)
        bottomView.addSubview(imageReceived)
        bottomView.addSubview(labelReceived)
        view.addSubview(buttonAdd)
    }
    override func setupLayout() {
        //MARK: Top View Layout
        topView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: UIApplication.shared.statusBarFrame.height + 100)
        
        imageViewLogo.frame = CGRect(x: 20, y: UIApplication.shared.statusBarFrame.height, width: 100, height: 50)
        
        topView.addConstraintsWithFormat(format: "V:[v0(50)]|", views: labelAuthors)
        topView.addConstraintsWithFormat(format: "V:[v0(50)]|", views: labelBooks)
        topView.addConstraintsWithFormat(format: "V:[v0(50)]|", views: labelActivities)
        topView.addConstraintsWithFormat(format: "H:|[v0(\(view.frame.width/3))][v1(\(view.frame.width/3))][v2(\(view.frame.width/3))]|", views: labelAuthors,labelBooks,labelActivities)
        
        topView.addConstraintsWithFormat(format: "V:[v0(50)]|", views: buttonAuthors)
        topView.addConstraintsWithFormat(format: "V:[v0(50)]|", views: buttonBooks)
        topView.addConstraintsWithFormat(format: "V:[v0(50)]|", views: buttonActivities)
        topView.addConstraintsWithFormat(format: "H:|[v0(\(view.frame.width/3))][v1(\(view.frame.width/3))][v2(\(view.frame.width/3))]|", views: buttonAuthors,buttonBooks,buttonActivities)
        
        //MARK: Bottom View Layout
        bottomView.frame.origin = CGPoint(x: 0, y: view.frame.height - bottomView.frame.height)
        
        let distance = view.frame.width / 5
        bottomView.addConstraintsWithFormat(format: "V:|-5-[v0]", views: imageProfile)
        bottomView.addConstraintsWithFormat(format: "H:|-\(distance - 10)-[v0]", views: imageProfile)
        
        bottomView.addConstraintsWithFormat(format: "V:[v0(15)]-5-|", views: labelProfile)
        bottomView.addConstraintsWithFormat(format: "H:|-\(distance / 2)-[v0(\(distance))]", views: labelProfile)
        
        bottomView.addConstraintsWithFormat(format: "V:|-5-[v0]", views: imageReceived)
        bottomView.addConstraintsWithFormat(format: "H:[v0]-\(distance - 10)-|", views: imageReceived)
        
        bottomView.addConstraintsWithFormat(format: "V:[v0(15)]-5-|", views: labelReceived)
        bottomView.addConstraintsWithFormat(format: "H:[v0(\(distance))]-\(distance / 2)-|", views: labelReceived)
        
        buttonAdd.center = CGPoint(x: view.center.x, y: bottomView.frame.origin.y + 15)
        buttonAddAuthor.frame = CGRect(x: view.center.x - 120, y: view.frame.height, width: 60, height: 60)
        buttonAddBook.frame = CGRect(x: view.center.x - 30, y: view.frame.height, width: 60, height: 60)
        buttonAddActivity.frame = CGRect(x: view.center.x + 60, y: view.frame.height, width: 60, height: 60)
        
        //MARK: Content View Layout
        contentViewForAuthors.frame = CGRect(x: 0, y: topView.frame.height, width: view.frame.width, height: bottomView.frame.origin.y - topView.frame.height)
        
        contentViewForBooks.frame = contentViewForAuthors.frame
        contentViewForBooks.center.x = view.center.x + view.frame.width
        
        contentViewForActivities.frame = contentViewForBooks.frame
        contentViewForActivities.center.x = contentViewForBooks.center.x + view.frame.width
    }
    
    //MARK: Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getDataSources()
    }
}

//MARK: UI Elements Actions
extension PrincipalPageViewController {
    @objc func setAuthorsContent() {
        print("Setting Authors")
        labelAuthors.textColor = .white
        labelBooks.textColor = .GRAY
        labelActivities.textColor = .GRAY
        
        transitionPage(from: currentPage, to: authorsPage)
    }
    
    @objc func setBooksContent() {
        print("Setting Books")
        labelAuthors.textColor = .GRAY
        labelBooks.textColor = .white
        labelActivities.textColor = .GRAY
        
        transitionPage(from: currentPage, to: booksPage)
    }
    
    @objc func setActivitiesContent() {
        print("Setting Activities")
        labelAuthors.textColor = .GRAY
        labelBooks.textColor = .GRAY
        labelActivities.textColor = .white
        
        transitionPage(from: currentPage, to: activitiesPage)
    }
    
    func transitionPage(from: CGFloat, to: CGFloat) {
        let width = view.frame.width
        UIView.animate(withDuration: 0.25, animations: {
            self.contentViewForAuthors.center.x -= (to - from) * width
            self.contentViewForBooks.center.x -= (to - from) * width
            self.contentViewForActivities.center.x -= (to - from) * width
        }) { (animated) in
            self.currentPage = to
        }
    }
    
    @objc func addButtonPressed () {
        print("Adding")
        if isAddMenuVisible {
            dismissAddMenu()
        } else {
            showAddMenu()
        }
    }
    
    @objc func add (sender: UIButton) {
        if sender.isEqual(buttonAddAuthor) {
            print("Adding Author")
            print("Adding Book")
            let createAuthorVC = CreateAuthorViewController()
            createAuthorVC.delegate = self
            createAuthorVC.modalPresentationStyle = .overCurrentContext
            navigationController?.present(createAuthorVC, animated: true, completion: nil)
        }
        if sender.isEqual(buttonAddBook) {
            print("Adding Book")
            let createBookVC = CreateBookViewController()
            createBookVC.delegate = self
            createBookVC.modalPresentationStyle = .overCurrentContext
            navigationController?.present(createBookVC, animated: true, completion: nil)
        }
        if sender.isEqual(buttonAddActivity) {
            print("Adding Activity")
            let createActivityVC = CreateActivityViewController()
            createActivityVC.delegate = self
            createActivityVC.modalPresentationStyle = .overCurrentContext
            navigationController?.present(createActivityVC, animated: true, completion: nil)
        }
    }
    
    func showAddMenu () {
        isAddMenuVisible = true
        UIView.animate(withDuration: 0.25) {
            self.buttonAddAuthor.frame.origin.y -= self.bottomView.frame.height + 80
        }
        UIView.animate(withDuration: 0.50) {
            self.buttonAddBook.frame.origin.y -= self.bottomView.frame.height + 100
        }
        UIView.animate(withDuration: 0.75) {
            self.buttonAddActivity.frame.origin.y -= self.bottomView.frame.height + 80
        }
    }
    
    func dismissAddMenu () {
        isAddMenuVisible = false
        UIView.animate(withDuration: 0.25) {
            self.buttonAddAuthor.frame.origin.y += self.bottomView.frame.height + 80
        }
        UIView.animate(withDuration: 0.50) {
            self.buttonAddBook.frame.origin.y += self.bottomView.frame.height + 100
        }
        UIView.animate(withDuration: 0.75) {
            self.buttonAddActivity.frame.origin.y += self.bottomView.frame.height + 80
        }
    }
}

//MARK: DataSources Management
extension PrincipalPageViewController {
    func getDataSources () {
        ConnectionManager.getArray(of: .Authors) { (array) in
            if array != nil {
                self.contentViewForAuthors.authors = array as! [AuthorModel]?
                self.contentViewForAuthors.reloadDataWithAnimation()
            }
        }
        ConnectionManager.getArray(of: .Books) { (array) in
            if array != nil {
                self.contentViewForBooks.books = array as! [BookModel]?
                self.contentViewForBooks.reloadDataWithAnimation()
            }
        }
        ConnectionManager.getArray(of: .Activities) { (array) in
            if array != nil {
                self.contentViewForActivities.activities = array as! [ActivityModel]?
                self.contentViewForActivities.reloadDataWithAnimation()
            }
        }
    }
}

//MARK: CreateElementViewDelegate Management
extension PrincipalPageViewController: CreateElementViewDelegate {
    func dismissView() {
        navigationController?.dismiss(animated: true, completion: {
            self.addButtonPressed()
        })
    }
}

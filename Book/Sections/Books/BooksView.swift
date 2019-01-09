//
//  BooksView.swift
//  Book
//
//  Created by Javier Cruz Santiago on 1/6/19.
//  Copyright © 2019 Javier Cruz Santiago. All rights reserved.
//

import Foundation
import UIKit

class BooksView: UITableView {
    private var context: UIViewController!
    private var viewFrame: CGRect!
    var books: [BookModel]! = []
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    func setupInfo (context: UIViewController) {
        self.context = context
        self.viewFrame = self.context.view.frame
        backgroundColor = .clear
        register(BookTableViewCell.self, forCellReuseIdentifier: BookTableViewCell.ID)
        rowHeight = 200
        separatorStyle = .none
        allowsSelection = false
        delegate = self
        dataSource = self
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refreshDataSource), for: .valueChanged)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: DataSource Management
extension BooksView {
    @objc func refreshDataSource () {
        print("Refreshing...")
        let loaderViewController = LoaderViewController()
        loaderViewController.modalPresentationStyle = .overCurrentContext
        loaderViewController.delegate = self
        loaderViewController.setInfo(method: .get, type: .Books)
        context.navigationController?.present(loaderViewController, animated: true, completion: {
            self.refreshControl?.endRefreshing()
        })
    }
}

//MARK: LoaderViewControllerDelegateManagement
extension BooksView: LoaderViewControllerDelegate {
    func dismissView(animated: Bool) {
        let loaderViewController = context.navigationController?.presentedViewController as! LoaderViewController
        let array = loaderViewController.getArrayDataSource()
        if array != nil {
            books = array as! [BookModel]?
            reloadDataWithAnimation()
        }
        context.navigationController?.dismiss(animated: true, completion: nil)
    }
}

//MARK: TableViewDelegate Management
extension BooksView: UITableViewDelegate {

}

//MARK: TableViewDataSource Management
extension BooksView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookTableViewCell.ID, for: indexPath) as! BookTableViewCell
        cell.infoView.frame = CGRect(x: 20, y: 15, width: viewFrame.width - 40, height: tableView.rowHeight - 30)
        cell.labelBookTitle.text = books[indexPath.row].Title
        cell.labelBookPublished.text = books[indexPath.row].PublishDate?.components(separatedBy: "T")[0]
        cell.labelBookPages.text = "\(books[indexPath.row].PageCount ?? -1)"
        return cell
    }
}

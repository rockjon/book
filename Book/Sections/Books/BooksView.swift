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
    
    var infoViewHeight: Int!
    var expandedCellIndex: Int?
    var expand: Bool?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    func setupInfo (context: UIViewController) {
        self.context = context
        self.viewFrame = self.context.view.frame
        backgroundColor = .clear
        register(BookTableViewCell.self, forCellReuseIdentifier: BookTableViewCell.ID)
//        rowHeight = 200
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
        tableView.rowHeight = 200
        if indexPath.row == expandedCellIndex {
            if expand ?? false {
                let cell = BookTableViewCell(frame: CGRect(x: 0, y: 0, width: viewFrame.width, height: tableView.rowHeight))
                cell.infoView.frame = CGRect(x: 20, y: 15, width: viewFrame.width - 40, height: tableView.rowHeight - 30)
                cell.setData(book: books[indexPath.row])
                cell.buttonSeeMore.tag = indexPath.row
                cell.buttonSeeMore.addTarget(self, action: #selector(expandRow(sender:)), for: .touchUpInside)
                tableView.rowHeight = 500
                UIView.animate(withDuration: 0.5, animations: {
                    cell.infoView.frame = CGRect(x: 20, y: 15, width: self.viewFrame.width - 40, height: tableView.rowHeight - 30)
                }) { (animated) in
                    cell.showViews()
                }
                return cell
            } else {
                tableView.rowHeight = 500
                let cell = BookTableViewCell(frame: CGRect(x: 0, y: 0, width: viewFrame.width, height: tableView.rowHeight))
                cell.infoView.frame = CGRect(x: 20, y: 15, width: viewFrame.width - 40, height: tableView.rowHeight - 30)
                cell.setData(book: books[indexPath.row])
                cell.buttonSeeMore.tag = indexPath.row
                cell.buttonSeeMore.addTarget(self, action: #selector(expandRow(sender:)), for: .touchUpInside)
                tableView.rowHeight = 200
                cell.hideViews()
                UIView.animate(withDuration: 0.5) {
                    cell.infoView.frame = CGRect(x: 20, y: 15, width: self.viewFrame.width - 40, height: tableView.rowHeight - 30)
                }
            }
        }
        let reusableCell = tableView.dequeueReusableCell(withIdentifier: BookTableViewCell.ID, for: indexPath) as! BookTableViewCell
        reusableCell.infoView.frame = CGRect(x: 20, y: 15, width: viewFrame.width - 40, height: tableView.rowHeight - 30)
        reusableCell.setData(book: books[indexPath.row])
        reusableCell.buttonSeeMore.tag = indexPath.row
        reusableCell.buttonSeeMore.addTarget(self, action: #selector(expandRow(sender:)), for: .touchUpInside)
        return reusableCell
    }
}

//MARK: Expand an Collapse Row
extension BooksView {
    @objc func expandRow (sender: UIButton) {
        if sender.tag == expandedCellIndex {
            print("Collapsing row at: \(sender.tag)")
            expandedCellIndex = nil
            expand = false
        } else {
            print("Expanding row at: \(sender.tag)")
            expandedCellIndex = sender.tag
            expand = true
        }
        reloadData()
//        reloadDataWithAnimation()
//        sender.removeTarget(self, action: #selector(expandRow(sender:)), for: .touchUpInside)
//        sender.addTarget(self, action: #selector(collapseRow(sender:)), for: .touchUpInside)
    }
    
//    @objc func collapseRow (sender: UIButton) {
//        print("CollapseRow at: \(sender.tag)")
//        sender.removeTarget(self, action: #selector(collapseRow(sender:)), for: .touchUpInside)
//        sender.addTarget(self, action: #selector(expandRow(sender:)), for: .touchUpInside)
//    }
}

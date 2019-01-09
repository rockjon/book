//
//  AuthorsViewController.swift
//  Book
//
//  Created by Javier Cruz Santiago on 1/5/19.
//  Copyright © 2019 Javier Cruz Santiago. All rights reserved.
//

import Foundation
import UIKit

class AuthorsView: UITableView {
    private var context: UIViewController!
    private var viewFrame: CGRect!
    var authors: [AuthorModel]? = []
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    func setupInfo (context: UIViewController) {
        self.context = context
        self.viewFrame = self.context.view.frame
        backgroundColor = .clear
        register(AuthorTableViewCell.self, forCellReuseIdentifier: AuthorTableViewCell.ID)
        rowHeight = 85
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
extension AuthorsView {
    @objc func refreshDataSource () {
        print("Refreshing...")
        let loaderViewController = LoaderViewController()
        loaderViewController.modalPresentationStyle = .overCurrentContext
        loaderViewController.delegate = self
        loaderViewController.setInfo(method: .get, type: .Authors)
        context.navigationController?.present(loaderViewController, animated: true, completion: {
            self.refreshControl?.endRefreshing()
        })
    }
}

//MARK: LoaderDelegate Management
extension AuthorsView: LoaderViewControllerDelegate {
    func dismissView(animated: Bool) {
        let loaderViewController = context.navigationController?.presentedViewController as! LoaderViewController
        let array = loaderViewController.getArrayDataSource()
        if array != nil {
            authors = array as! [AuthorModel]?
            reloadDataWithAnimation()
        }
        context.navigationController?.dismiss(animated: true, completion: nil)
    }
}

//MARK: TableViewDelegate Management
extension AuthorsView: UITableViewDelegate {
    
}

//MARK: TableViewDataSource Management
extension AuthorsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return authors?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AuthorTableViewCell.ID, for: indexPath) as! AuthorTableViewCell
        cell.labelAuthorFirstName.text = authors?[indexPath.row].FirstName
        cell.labelAuthorLastName.text = authors?[indexPath.row].LastName
        cell.buttonMessage.tag = indexPath.row
        cell.buttonMessage.addTarget(self, action: #selector(didPressMessageButton(sender:)), for: .touchUpInside)
        cell.buttonContacts.tag = indexPath.row
        cell.buttonContacts.addTarget(self, action: #selector(didPressContactsButton(sender:)), for: .touchUpInside)
        cell.buttonNotifications.tag = indexPath.row
        cell.buttonNotifications.addTarget(self, action: #selector(didPressNotificationsButton(sender:)), for: .touchUpInside)
        return cell
    }
}

//MARK: Cells buttons actions
extension AuthorsView {
    @objc func didPressMessageButton(sender: UIButton) {
        print("Message for cell: \(sender.tag)")
    }
    
    @objc func didPressContactsButton(sender: UIButton) {
        print("Contacts for cell: \(sender.tag)")
    }
    
    @objc func didPressNotificationsButton(sender: UIButton) {
        print("Notification for cell: \(sender.tag)")
    }
}

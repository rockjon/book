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
    private var viewFrame: CGRect!
    
    var books: [BookModel]! = []
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    func setupInfo (viewFrame: CGRect) {
        self.viewFrame = viewFrame
        backgroundColor = .clear
        register(BookTableViewCell.self, forCellReuseIdentifier: BookTableViewCell.ID)
        rowHeight = 200
        separatorStyle = .none
        allowsSelection = false
        delegate = self
        dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

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
    private var viewFrame: CGRect!
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    func setupInfo (viewFrame: CGRect) {
        self.viewFrame = viewFrame
        backgroundColor = .clear
        register(AuthorTableViewCell.self, forCellReuseIdentifier: AuthorTableViewCell.ID)
        rowHeight = 85
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
extension AuthorsView: UITableViewDelegate {
    
}

//MARK: TableViewDataSource Management
extension AuthorsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AuthorTableViewCell.ID, for: indexPath) as! AuthorTableViewCell
        return cell
    }
    
    
}

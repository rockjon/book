//
//  ExtensionUITableView.swift
//  Book
//
//  Created by Javier Cruz Santiago on 1/8/19.
//  Copyright © 2019 Javier Cruz Santiago. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func reloadDataWithAnimation () {
        let range = NSMakeRange(0, self.numberOfSections)
        let sections = NSIndexSet(indexesIn: range)
        self.reloadSections(sections as IndexSet, with: .automatic)
    }
}

extension UICollectionView {
    func reloadDataWithAnimation () {
        let range = NSMakeRange(0, self.numberOfSections)
        let sections = NSIndexSet(indexesIn: range)
        self.reloadSections(sections as IndexSet)
    }
}

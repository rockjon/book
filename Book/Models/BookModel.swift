//
//  BookModel.swift
//  MyBook
//
//  Created by Javier Cruz Santiago on 1/2/19.
//  Copyright © 2019 Javier Cruz Santiago. All rights reserved.
//

import Foundation

struct BookModel: Codable {
    var ID: Int?
    var Title: String?
    var Description: String?
    var PageCount: Int?
    var Excerpt: String?
    var PublishDate: String?
}

//
//  ActivityModel.swift
//  MyBook
//
//  Created by Javier Cruz Santiago on 1/3/19.
//  Copyright © 2019 Javier Cruz Santiago. All rights reserved.
//

import Foundation

struct ActivityModel: Codable {
    var ID: Int?
    var Title: String?
    var DueDate: String?
    var Completed: Bool?
}

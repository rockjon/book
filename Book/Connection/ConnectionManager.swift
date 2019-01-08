//
//  ConnectionManager.swift
//  Book
//
//  Created by Javier Cruz Santiago on 1/7/19.
//  Copyright © 2019 Javier Cruz Santiago. All rights reserved.
//

import Foundation
import Alamofire

class ConnectionManager {
    public static func getBooks(closure : @escaping ([BookModel]?) -> Void) {
        let url = ConnectionStrings.getBooksUrl()
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: [:]).responseJSON { (response) in
            switch response.result {
            case .success:
                print("Response: \(response)")
                do {
                    let books = try JSONDecoder().decode([BookModel].self, from: response.data!)
                    closure(books)
                } catch {
                    print("Somethings wrong")
                    closure(nil)
                }
                break
            case .failure:
                print("Something is wrong")
                closure(nil)
                break
            }
        }
    }
}

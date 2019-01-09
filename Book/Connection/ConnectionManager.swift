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
    public static func getArray(of: LoadInfoType, closure: @escaping ([Any]?) -> Void) {
        var url:String!
        
        switch of {
        case .Authors:
            url = ConnectionStrings.getAuthorsUrl()
            break
        case .Books:
            url = ConnectionStrings.getBooksUrl()
            break
        case .Activities:
            url = ConnectionStrings.getActivitiesUrl()
            break
        default:
            closure(nil)
        }
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: [:]).responseJSON { (response) in
            switch response.result {
            case .success:
                let responseMapped = ConnectionManager.mapArrayRequestResponse(from: response.data!, to: of)
                closure(responseMapped)
                break
            case .failure:
                closure(nil)
                break
            }
        }
    }
    
    static func mapArrayRequestResponse(from: Data, to: LoadInfoType) -> [Any]? {
        do {
            switch to {
            case .Authors:
                return try JSONDecoder().decode([AuthorModel]?.self, from: from) as [Any]?
            case .Books:
                return try JSONDecoder().decode([BookModel]?.self, from: from) as [Any]?
            case .Activities:
                return try JSONDecoder().decode([ActivityModel]?.self, from: from) as [Any]?
            default:
                return nil
            }
        } catch {
            return nil
        }
    }
}

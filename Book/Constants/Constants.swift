//
//  Constants.swift
//  MyBook
//
//  Created by Javier Cruz Santiago on 12/11/18.
//  Copyright © 2018 Javier Cruz Santiago. All rights reserved.
//

import Foundation

class UserDefaultsKeys {
    public static let PASSED_TUTORIAL = "passedTutorial"
    public static let IS_LOGED = "logedYet"
}

class ConnectionStrings {
    //MARK: Urls
    private static let BASE_URL = "https://fakerestapi.azurewebsites.net"
    private static let ACTIVITIES_URL = "/api/Activities"
    private static let AUTHORS_URL = "/api/Authors"
    private static let AUTHORS_BOOKS = "/authors/books"
    private static let BOOKS_URL = "/api/Books"
    private static let COVER_PHOTOS_URL = "/api/CoverPhotos"
    private static let COVER_PHOTOS_BOOKS = "/books/covers"
    private static let USERS_URL = "/api/Users"
    
    public static func getBaseUrl() -> String {
        return BASE_URL
    }
    
    //MARK: Activities
    public static func getActivitiesUrl() -> String {
        return BASE_URL + ACTIVITIES_URL
    }
    
    public static func getUrlForActivity(id user: Int) -> String {
        return getActivitiesUrl() + "/\(user)"
    }
    
    //MARK: Authors
    public static func getAuthorsUrl() -> String {
        return BASE_URL + AUTHORS_URL
    }
    
    public static func getUrlForAuthor(id author: Int) -> String {
        return getAuthorsUrl() + "/\(author)"
    }
    
    public static func getAuthorForBook(id book: Int) -> String {
        return BASE_URL + AUTHORS_BOOKS + "/\(book)"
    }
    
    //MARK: Books
    public static func getBooksUrl() -> String {
        return BASE_URL + BOOKS_URL
    }
    
    public static func getUrlForBook(id book: Int) -> String {
        return getAuthorsUrl() + "/\(book)"
    }
    
    //MARK: CoverPhotos
    public static func getCoverPhotosUrl() -> String {
        return BASE_URL + COVER_PHOTOS_URL
    }
    
    public static func getUrlForCoverPhoto(id photo: Int) -> String {
        return getCoverPhotosUrl() + "/\(photo)"
    }
    
    public static func getCoverPhotoForBook(id book: Int) -> String {
        return BASE_URL + COVER_PHOTOS_BOOKS + "/\(book)"
    }
    
    //MARK: Users
    public static func getUsersUrl() -> String {
        return BASE_URL + USERS_URL
    }
    
    public static func getUrlForUser(id user: Int) -> String {
        return getUsersUrl() + "/\(user)"
    }
}

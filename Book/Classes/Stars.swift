//
//  Stars.swift
//  Book
//
//  Created by Javier Cruz Santiago on 1/6/19.
//  Copyright © 2019 Javier Cruz Santiago. All rights reserved.
//

import Foundation
import UIKit

class Stars: UIView {
    
    //MARK: UI Elements
    var imageViewStarOne: UIImageView!
    var imageViewStarTwo: UIImageView!
    var imageViewStarThree: UIImageView!
    var imageViewStarFour: UIImageView!
    var imageViewStarFive: UIImageView!
    
    var spaceBetweenStars: CGFloat! = 5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: Create View
        imageViewStarOne = UIImageView(image: UIImage(named: "star"))
        imageViewStarOne.contentMode = .scaleAspectFit
        
        imageViewStarTwo = UIImageView(image: UIImage(named: "star"))
        imageViewStarTwo.contentMode = .scaleAspectFit
        
        imageViewStarThree = UIImageView(image: UIImage(named: "star"))
        imageViewStarThree.contentMode = .scaleAspectFit
        
        imageViewStarFour = UIImageView(image: UIImage(named: "star"))
        imageViewStarFour.contentMode = .scaleAspectFit
        
        imageViewStarFive = UIImageView(image: UIImage(named: "star"))
        imageViewStarFive.contentMode = .scaleAspectFit
        
        //MARK: Adding Views
        addSubview(imageViewStarOne)
        addSubview(imageViewStarTwo)
        addSubview(imageViewStarThree)
        addSubview(imageViewStarFour)
        addSubview(imageViewStarFive)
        
        //MARK: SetUp layout
        let starWidth = (frame.width - spaceBetweenStars * 6) / 5
        let starHeight = frame.height
        
        imageViewStarOne.frame = CGRect(x: spaceBetweenStars, y: 0, width: starWidth, height: starHeight)
        
        imageViewStarTwo.frame = CGRect(x: spaceBetweenStars + starWidth + spaceBetweenStars, y: 0, width: starWidth, height: starHeight)
        
        imageViewStarThree.frame = CGRect(x: (starWidth + spaceBetweenStars)*2 + spaceBetweenStars, y: 0, width: starWidth, height: starHeight)
        
        imageViewStarFour.frame = CGRect(x: (spaceBetweenStars + starWidth)*3 + spaceBetweenStars, y: 0, width: starWidth, height: starHeight)
        
        imageViewStarFive.frame = CGRect(x: (spaceBetweenStars + starWidth)*4 + spaceBetweenStars, y: 0, width: starWidth, height: starHeight)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

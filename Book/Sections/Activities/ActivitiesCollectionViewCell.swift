//
//  ActivitiesCollectionViewCell.swift
//  Book
//
//  Created by Jonathan Hernandez on 1/8/19.
//  Copyright © 2019 Javier Cruz Santiago. All rights reserved.
//

import UIKit

class ActivitiesCollectionViewCell: UICollectionViewCell {
    public static let ID = "ActivitiesCollectionViewCellId"
    
    var infoView: UIView!
    var activityIcon : UIImageView!
    var labelActivityTitle: UILabel!
    var labelProgress: UILabel!
    var labelProgressActivity : UILabel!
    var progressBar : UIProgressView!
    var labelTimeRemain : UILabel!
    var labelTimeRemainActivity: UILabel!
    var labeEndDate : UILabel!
    var labelEndDateActivity : UILabel!
    var btnFinish : UIButton!
    var btnEdit : UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        infoView = UIView()
        
        
        infoView.backgroundColor = .white
        infoView.layer.cornerRadius = 10
        infoView.addShadow(color: .black)
       
        contentView.addSubview(infoView)
        
        labelActivityTitle = UILabel.getCustomLabel(text: "ACTIVITY TITLE", font: .Medium, size: 13, color: .LIGHT_PINK, alignment: .left)
        labelProgress = UILabel.getCustomLabel(text: "Progress:", font: .Medium, size: 12, color: .LIGHT_PINK, alignment: .left)
        labelProgressActivity = UILabel.getCustomLabel(text: "75%", font: .Medium, size: 12, color: .LIGHT_PINK, alignment: .left)
        labelProgress = UILabel.getCustomLabel(text: "Progress:", font: .Medium, size: 12, color: .LIGHT_PINK, alignment: .left)
        labelTimeRemain = UILabel.getCustomLabel(text: "Time Remaining:", font: .Medium, size: 12, color: .LIGHT_PINK, alignment: .left)
        labelTimeRemainActivity = UILabel.getCustomLabel(text: "0 days", font: .Medium, size: 12, color: .LIGHT_PINK, alignment: .left)
        labeEndDate = UILabel.getCustomLabel(text: "End Date:", font: .Medium, size: 12, color: .LIGHT_PINK, alignment: .left)
        labelEndDateActivity = UILabel.getCustomLabel(text: " 12/20/20", font: .Medium, size: 12, color: .LIGHT_PINK, alignment: .left)
        
        btnFinish = UIButton()
        btnFinish.backgroundColor = UIColor.SAND
        btnFinish.setTitle("Finish", for: .normal)
        btnFinish.titleLabel?.font = UIFont(name: "AvenirNext-Regular" , size: 12)
        btnFinish.tintColor = UIColor.FONT_COLOR
        btnFinish.layer.cornerRadius = 5
        //btnFinish.tintColor = UIColor.SAND
        
        btnEdit = UIButton()
        btnEdit.setImage(UIImage(named: "editBtn"), for: .normal)
  
        
        activityIcon = UIImageView(image: UIImage(named: "icFlight"))
        
        progressBar = UIProgressView()
        progressBar.setProgress(0.70, animated: false)
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 3)
        progressBar.layer.cornerRadius = 3
        progressBar.clipsToBounds = true
        progressBar.layer.sublayers![1].cornerRadius = 3
        progressBar.subviews[1].clipsToBounds = true
        progressBar.tintColor = UIColor.OLIVA
        
        infoView.addSubview(labelActivityTitle)
        infoView.addSubview(activityIcon)
        infoView.addSubview(labelProgress)
        infoView.addSubview(labelProgressActivity)
        infoView.addSubview(progressBar)
        infoView.addSubview(labelTimeRemain)
        infoView.addSubview(labelTimeRemainActivity)
        infoView.addSubview(labeEndDate)
        infoView.addSubview(labelEndDateActivity)
        infoView.addSubview(btnFinish)
        infoView.addSubview(btnEdit)
        
        infoView.addConstraintsWithFormat(format: "V:|-20-[v0(30)]", views: activityIcon)
        infoView.addConstraintsWithFormat(format: "V:|-25-[v0(30)]", views: labelActivityTitle)
        infoView.addConstraintsWithFormat(format: "H:|-20-[v0(30)]-10-[v1]-20-|", views: activityIcon,labelActivityTitle)
        
        infoView.addConstraintsWithFormat(format: "V:[v0]-10-[v1]", views: activityIcon,labelProgress)
        infoView.addConstraintsWithFormat(format: "V:[v0]-10-[v1]", views: activityIcon,labelProgressActivity)
        infoView.addConstraintsWithFormat(format: "H:|-20-[v0]-10-[v1]-20-|", views: labelProgress,labelProgressActivity)
        
        infoView.addConstraintsWithFormat(format: "V:[v0]-6-[v1]", views: labelProgress,progressBar)
        infoView.addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: progressBar)
        
        infoView.addConstraintsWithFormat(format: "V:[v0]-6-[v1]", views: progressBar,labelTimeRemain)
        infoView.addConstraintsWithFormat(format: "V:[v0]-6-[v1]", views: progressBar,labelTimeRemainActivity)
        infoView.addConstraintsWithFormat(format: "H:|-20-[v0]-10-[v1]-20-|", views: labelTimeRemain,labelTimeRemainActivity)
        
        infoView.addConstraintsWithFormat(format: "V:[v0]-6-[v1]", views: labelTimeRemain,labeEndDate)
        infoView.addConstraintsWithFormat(format: "V:[v0]-6-[v1]", views: labelTimeRemain,labelEndDateActivity)
        infoView.addConstraintsWithFormat(format: "H:|-20-[v0]-10-[v1]-20-|", views: labeEndDate,labelEndDateActivity)
        
        infoView.addConstraintsWithFormat(format: "V:|-[v0(25)]-12-|", views: btnFinish)
        infoView.addConstraintsWithFormat(format: "V:|-[v0(25)]-12-|", views: btnEdit)
        infoView.addConstraintsWithFormat(format: "H:|-20-[v0(78)]-40-[v1(23)]-20-|", views: btnFinish,btnEdit)
        
       
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  ActivitiesView.swift
//  Book
//
//  Created by Jonathan Hernandez on 1/7/19.
//  Copyright © 2019 Javier Cruz Santiago. All rights reserved.
//

import UIKit

class ActivitiesView: UICollectionView {
    private var context: UIViewController!
    private var viewFrame: CGRect!
    
    var activities: [ActivityModel]! = []
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout:  UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupInfo (context: UIViewController) {
        self.context = context
        self.viewFrame = self.context.view.frame
        backgroundColor = .clear
        register(ActivitiesCollectionViewCell.self, forCellWithReuseIdentifier: ActivitiesCollectionViewCell.ID)
        delegate = self
        dataSource = self
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refreshDataSource), for: .valueChanged)
    }
}
extension ActivitiesView {
    @objc func refreshDataSource () {
        print("Refreshing...")
        let loaderViewController = LoaderViewController()
        loaderViewController.modalPresentationStyle = .overCurrentContext
        loaderViewController.delegate = self
        loaderViewController.setInfo(method: .get, type: .Activities)
        context.navigationController?.present(loaderViewController, animated: true, completion: {
            self.refreshControl?.endRefreshing()
        })
    }
}
extension ActivitiesView: LoaderViewControllerDelegate {
    func dismissView(animated: Bool) {
        let loaderViewController = context.navigationController?.presentedViewController as! LoaderViewController
        let array = loaderViewController.getArrayDataSource()
        if array != nil {
            activities = array as! [ActivityModel]?
            reloadDataWithAnimation()
        }
        context.navigationController?.dismiss(animated: true, completion: nil)
    }
}

extension ActivitiesView : UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  10
        let collectionViewSize = collectionView.frame.size.width-padding
        
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
    
}

extension ActivitiesView : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activities.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActivitiesCollectionViewCell.ID, for: indexPath) as! ActivitiesCollectionViewCell
      cell.infoView.frame = CGRect(x: 10, y: 20, width: (collectionView.frame.size.width-50)/2, height: (collectionView.frame.size.width-30)/2)
        //cell.backgroundColor = UIColor.green
        cell.labelActivityTitle.text = activities?[indexPath.row].Title
        cell.labelEndDateActivity.text = activities?[indexPath.row].DueDate?.components(separatedBy: "T")[0]
        return cell
    }
    

    
    
}

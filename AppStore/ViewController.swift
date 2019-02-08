//
//  ViewController.swift
//  AppStore
//
//  Created by NDS on 06/02/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

class FeatureAppsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private let cellId = "cellId"
    var categories: allCategories?
    var lineApp: [lineOfApp]?
    
//    var appCategories: [Categories]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lineOfApp.fetchFeaturedApps { (data) in
            self.categories = data
            self.lineApp = data.categories
            self.collectionView?.reloadData()
        }
    
//        appCategories = AppCategory.sampleAppCategories()
//        AppCategory.fetchFeaturedApps()
        Service.sharedInstance.fetchFeatureApps()
        
        collectionView.backgroundColor = .white
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? CategoryCell
        else {
            fatalError("unresolved cell ID")
        }
        
        cell.appCategory = lineApp?[indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = lineApp?.count { return count }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 230)
    }


}

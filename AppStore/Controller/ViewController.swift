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
    private let largeCellId = "largerCellId"
    private let headerId = "headerId"
    var categories: allCategories?
    var lineApp: [lineOfApp]?
    
//    let statusBarView: UIView = {
//        let view = UIView(frame: UIApplication.shared.statusBarFrame)
//        view.backgroundColor = .blue
//        return view
//    }()
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarView.backgroundColor = UIColor(red: 100/255, green: 149/255, blue: 237/255, alpha: 1.0)
        navigationItem.title = "Featured Apps"
        navigationController?.navigationBar.isTranslucent = false
//        navigationController?.hidesBarsOnSwipe = true
//        navigationController?.navigationBar.barTintColor = .blue
    

        
        ServiceJSon.sharedInstance.fetchFeaturedApps { (data) in
            self.categories = data
            self.lineApp = data.categories
            self.collectionView?.reloadData()
        }
        
        collectionView.backgroundColor = .white
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(LargeCategoryCell.self, forCellWithReuseIdentifier: largeCellId)
        collectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 2 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeCellId, for: indexPath) as? LargeCategoryCell else {
                fatalError("Error show large cell")
            }
            cell.appCategory = lineApp?[indexPath.item]
            cell.featuredAppsController = self
            return cell
        }
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? CategoryCell
        else {
            fatalError("Error show category cell")
        }
        
        cell.appCategory = lineApp?[indexPath.item]
        cell.featuredAppsController = self
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = lineApp?.count { return count }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 2 {
            return CGSize(width: view.frame.width, height: 160)
        }
        return CGSize(width: view.frame.width, height: 230)
    }
    
    func showDetailForApp(app: inLineOfApp) {
        let layout = UICollectionViewFlowLayout()
        let appDetailController = AppDetailController(collectionViewLayout: layout)
        appDetailController.app = app
        navigationController?.pushViewController(appDetailController, animated: true)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! HeaderCell
        header.appCategory = categories?.bannerCategory
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 125)
    }
}




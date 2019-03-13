//
//  HeaderCell.swift
//  AppStore
//
//  Created by NDS on 09/02/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

class HeaderCell: CategoryCell {
    private let bannerCellId = "bannerCellId"
    
    override func setupViews() {
        appCollectionView.dataSource = self
        appCollectionView.delegate = self
        appCollectionView.register(bannerCell.self, forCellWithReuseIdentifier: bannerCellId)
        
        addSubview(appCollectionView)
        
        var nsLayoutConstraint: [NSLayoutConstraint] = []
        
        let imageVerticalConstrains = NSLayoutConstraint.constraints(withVisualFormat: "V:|[appCollectionView]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0) , metrics: nil, views: ["appCollectionView": appCollectionView])
        nsLayoutConstraint += imageVerticalConstrains
        
        let imageHorizontalConstrains = NSLayoutConstraint.constraints(withVisualFormat: "H:|[appCollectionView]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0) , metrics: nil, views: ["appCollectionView": appCollectionView])
        nsLayoutConstraint += imageHorizontalConstrains
        
        NSLayoutConstraint.activate(nsLayoutConstraint)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bannerCellId, for: indexPath) as! AppsCell
        cell.app = appCategory?.apps?[indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 2 + 50, height: frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    private class bannerCell: AppsCell {
        
        override func setupViews() {
            
            featureImageView.translatesAutoresizingMaskIntoConstraints = false
            featureImageView.layer.cornerRadius = 3
            featureImageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
            featureImageView.layer.borderWidth = 0.5
            addSubview(featureImageView)
            
            var nsLayoutConstraint: [NSLayoutConstraint] = []
            
            let imageVerticalConstrains = NSLayoutConstraint.constraints(withVisualFormat: "V:|[featureImageView]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0) , metrics: nil, views: ["featureImageView": featureImageView])
            nsLayoutConstraint += imageVerticalConstrains
            
            let imageHorizontalConstrains = NSLayoutConstraint.constraints(withVisualFormat: "H:|[featureImageView]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0) , metrics: nil, views: ["featureImageView": featureImageView])
            nsLayoutConstraint += imageHorizontalConstrains
            
            NSLayoutConstraint.activate(nsLayoutConstraint)
            
        }
    }
    
    
}

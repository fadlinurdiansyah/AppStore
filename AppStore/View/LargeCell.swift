//
//  LargeCell.swift
//  AppStore
//
//  Created by NDS on 09/02/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

class LargeCategoryCell: CategoryCell {
    
    private let largeAppCellId = "largeAppCellId"
    override func setupViews() {
        super.setupViews()
        appCollectionView.register(LargeAppCell.self, forCellWithReuseIdentifier: largeAppCellId)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeAppCellId, for: indexPath) as! AppsCell
        cell.app = appCategory?.apps?[indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: frame.height - 32)
    }
    
    private class LargeAppCell: AppsCell {
        override func setupViews() {
            featureImageView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(featureImageView)
            
            var nsLayoutConstraint: [NSLayoutConstraint] = []
            
            let imageVerticalConstrains = NSLayoutConstraint.constraints(withVisualFormat: "V:|-2-[featureImageView]-14-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0) , metrics: nil, views: ["featureImageView": featureImageView])
            nsLayoutConstraint += imageVerticalConstrains
            
            let imageHorizontalConstrains = NSLayoutConstraint.constraints(withVisualFormat: "H:|[featureImageView]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0) , metrics: nil, views: ["featureImageView": featureImageView])
            nsLayoutConstraint += imageHorizontalConstrains
            
            NSLayoutConstraint.activate(nsLayoutConstraint)
            
            
            
        }
    }
}

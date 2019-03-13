//
//  ScreenshotsCell.swift
//  AppStore
//
//  Created by NDS on 14/02/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

class ScreenshotsCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    
    var app: inLineOfApp? {
        didSet {
            scCollectionView.reloadData()
        }
    }
    
    let scCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        scCollectionView.dataSource = self
        scCollectionView.delegate = self
        
        addSubview(scCollectionView)
        addSubview(dividerLineView)
        
        
        scCollectionView.register(scImageCell.self, forCellWithReuseIdentifier: cellId)
        scCollectionView.translatesAutoresizingMaskIntoConstraints = false
        dividerLineView.translatesAutoresizingMaskIntoConstraints = false
   
        NSLayoutConstraint.activate([
            scCollectionView.heightAnchor.constraint(equalToConstant: frame.height),
//            scCollectionView.widthAnchor.constraint(equalToConstant: frame.width),
            scCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            scCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)
            ])
        
        NSLayoutConstraint.activate([
            dividerLineView.topAnchor.constraint(equalTo: scCollectionView.bottomAnchor, constant: 0),
            dividerLineView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 14),
            dividerLineView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            dividerLineView.heightAnchor.constraint(equalToConstant: 0.5)
            
            ])
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = app?.Screenshots?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = scCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! scImageCell
        
        if let imageName = app?.Screenshots?[indexPath.item] {
            cell.imageView.image = UIImage(named: imageName)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 240, height: frame.height - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
    private class scImageCell: BaseCell {
        
        let imageView: UIImageView = {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFill
            iv.backgroundColor = .green
            return iv
        }()
        override func setupViews() {
            super.setupViews()
            
            addSubview(imageView)
            
            layer.masksToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
//                imageView.widthAnchor.constraint(equalToConstant: frame.width),
//                imageView.heightAnchor.constraint(equalToConstant: frame.height)
                imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
                imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
                imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
                imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0)
                ])
        }
        
    }
}

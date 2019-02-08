//
//  File.swift
//  AppStore
//
//  Created by NDS on 06/02/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit
import TRON
import SwiftyJSON

class CategoryCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var appCategory: lineOfApp? {
        didSet {
            if let name = appCategory?.name {
                nameLabel.text = name
            }
            
        }
    }
    
    private let cellId = "appCellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "Best New Apps"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let appCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectioView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectioView.backgroundColor = .clear
        collectioView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectioView
    }()
    
    let bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupViews() {
        backgroundColor = .clear
       
        addSubview(nameLabel)
        addSubview(appCollectionView)
        addSubview(bottomLine)

        appCollectionView.dataSource = self
        appCollectionView.delegate = self
        
        appCollectionView.register(AppsCell.self, forCellWithReuseIdentifier: cellId)
        
        
        var nsLayoutConstraint: [NSLayoutConstraint] = []
        
        let nameLabelVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["v0": nameLabel])
        nsLayoutConstraint += nameLabelVerticalConstraints
        
        let bottomLineVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["v0": bottomLine])
        nsLayoutConstraint += bottomLineVerticalConstraints
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["v0": appCollectionView])
        nsLayoutConstraint += horizontalConstraints
        
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[nameLabel(30)][v0][v1(0.5)]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["v0": appCollectionView, "v1": bottomLine, "nameLabel": nameLabel])
        nsLayoutConstraint += verticalConstraints
        
        NSLayoutConstraint.activate(nsLayoutConstraint)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let appCount = appCategory?.apps?.count {
            return appCount
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsCell
        cell.app = appCategory?.apps?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height - 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
}

class AppsCell: UICollectionViewCell {
    
    var app: inLineOfApp? {
        didSet {
            nameLabel.text = app?.Name
            featureImageView.image = UIImage(named: (app?.ImageName)!)
            categoryLabel.text = app?.Category
            if let price = app?.Price {
                priceLabel.text = "$\(price)"
            } else {
                priceLabel.text = ""
            }
            
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let featureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "frozen")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        
        return imageView
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        label.text = "Disney Build it: Forzen"
        label.textColor = .darkGray
        return label
    }()
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "Entertaiment"
        label.textColor = .darkGray
        return label
    }()
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "$3.99"
        label.textColor = .darkGray
        return label
    }()
    
    func setupViews() {
        addSubview(featureImageView)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        addSubview(priceLabel)
        
        featureImageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: 100)
        nameLabel.frame = CGRect(x: 0, y: frame.width + 2, width: frame.width, height: 40)
        categoryLabel.frame = CGRect(x: 0, y: frame.width + 37, width: frame.width, height: 20)
        priceLabel.frame = CGRect(x: 0, y: frame.width + 52, width: frame.width, height: 20)
    }
}

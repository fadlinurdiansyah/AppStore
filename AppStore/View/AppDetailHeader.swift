//
//  HeaderAppDetail.swift
//  AppStore
//
//  Created by NDS on 14/02/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

class AppDetailHeader: BaseCell {
    
    var app: inLineOfApp? {
        didSet {
            if let imageName = app?.ImageName {
                appImageView.image = UIImage(named: imageName)
            }
            
            nameLabelApp.text = app?.Name
            categoryLabelApp.text = app?.Category
            
            if let price = app?.Price {
                buyButton.setTitle("$\(price)", for: .normal)
            }
        }
    }
    
    let appImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        return image
    }()
    
    let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Details","Reviews","Related"])
        sc.tintColor = .darkGray
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    let nameLabelApp: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Apps Name"
        return label
    }()
    
    let categoryLabelApp: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .gray
        label.text = "Category Apps"
        return label
    }()
    
    let buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("BUY", for: .normal)
        button.layer.borderColor = UIColor(red: 0, green: 129/255, blue: 250/255, alpha: 1).cgColor
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
        
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()
    
    
    override func setupViews() {
        super.setupViews()
        //        backgroundColor = .white
        addSubview(appImageView)
        addSubview(segmentedControl)
        addSubview(nameLabelApp)
        addSubview(categoryLabelApp)
        addSubview(buyButton)
        addSubview(dividerLineView)
        
        
        appImageView.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        nameLabelApp.translatesAutoresizingMaskIntoConstraints = false
        categoryLabelApp.translatesAutoresizingMaskIntoConstraints = false
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        dividerLineView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            appImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            appImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            appImageView.widthAnchor.constraint(equalToConstant: 100),
            appImageView.heightAnchor.constraint(equalToConstant: 100)
            ])
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: appImageView.bottomAnchor, constant: 16),
            segmentedControl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            segmentedControl.heightAnchor.constraint(equalToConstant: 34),
            segmentedControl.widthAnchor.constraint(equalToConstant: 300)
            ])
        
        NSLayoutConstraint.activate([
            nameLabelApp.topAnchor.constraint(equalTo: appImageView.topAnchor, constant: 0),
            nameLabelApp.leftAnchor.constraint(equalTo: appImageView.rightAnchor, constant: 10)
            ])
        
        NSLayoutConstraint.activate([
            categoryLabelApp.topAnchor.constraint(equalTo: nameLabelApp.bottomAnchor, constant: 2),
            categoryLabelApp.leftAnchor.constraint(equalTo: appImageView.rightAnchor, constant: 10)
            
            ])
        NSLayoutConstraint.activate([
            buyButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -14),
            buyButton.bottomAnchor.constraint(equalTo: appImageView.bottomAnchor, constant: 0),
            buyButton.widthAnchor.constraint(equalToConstant: 65)
            
            ])
        
        NSLayoutConstraint.activate([
            dividerLineView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 5),
            dividerLineView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            dividerLineView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            dividerLineView.heightAnchor.constraint(equalToConstant: 0.5)
            
            ])
        
    }
}

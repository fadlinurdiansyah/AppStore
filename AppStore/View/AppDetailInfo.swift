//
//  AppDetailInfo.swift
//  AppStore
//
//  Created by NDS on 16/02/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

class AppDetailInfo: BaseCell {
    
    var appInfo: appInfo? {
        didSet {
            print(appInfo?.Name)
            print(appInfo?.Value)
        }
    }
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Information"
        label.font = UIFont.systemFont(ofSize: 14)
//        label.textColor = .darkGray
        return label
    }()
    
    
    let infoTextView: UITextView = {
        let tv = UITextView()
        tv.text = "sample information\nsample informatin"
        tv.font = UIFont.systemFont(ofSize: 14)
        tv.backgroundColor = .clear
        tv.isEditable = false
        tv.isScrollEnabled = false
        return tv
    }()
    
    let valueTextView: UITextView = {
        let tv = UITextView()
        tv.text = "sample information\nsample informatin"
        tv.font = UIFont.systemFont(ofSize: 14)
        tv.backgroundColor = .clear
        tv.isEditable = false
        tv.isScrollEnabled = false
        return tv
    }()
    
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
    
//        addSubview(infoLabel)
//        addSubview(infoTextView)
        addSubview(dividerLineView)
//        setupInfoView()
        tesStackView()
    
//        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        dividerLineView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
//            infoLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
//            infoLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 14),
            
            dividerLineView.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            dividerLineView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 14),
            dividerLineView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            dividerLineView.heightAnchor.constraint(equalToConstant: 0.5)
            ])
    }
    
    fileprivate func setupInfoView() {
        
        let nameViewContainer = UIView()
        nameViewContainer.backgroundColor = .red
        
        let valueViewContainer = UIView()
        valueViewContainer.backgroundColor = .blue
        
        let infoStackView = UIStackView(arrangedSubviews: [nameViewContainer, valueViewContainer])
        infoStackView.axis = .horizontal
        infoStackView.distribution = .fill
        
        addSubview(infoStackView)
        
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        
//        NSLayoutConstraint.activate([
//            infoStackView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 0),
//            infoStackView.leftAnchor.constraint(equalTo: infoLabel.leftAnchor, constant: 0),
//            infoStackView.heightAnchor.constraint(equalToConstant: 100),
//            infoStackView.widthAnchor.constraint(equalToConstant: 300)
//            ])
    }
    
    fileprivate func tesStackView() {
        
        let view = UIView()
        let view2 = UIView()
        let stackView = UIStackView(arrangedSubviews: [view,view2])
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.spacing = 10
        
        addSubview(stackView)
        addSubview(infoLabel)
        addSubview(infoTextView)
        addSubview(valueTextView)
    
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoTextView.translatesAutoresizingMaskIntoConstraints = false
        valueTextView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        if (stackView.subviews.count % 2) == 0 {
            view.widthAnchor.constraint(equalToConstant: 100).isActive = true
            view.heightAnchor.constraint(equalToConstant: 170).isActive = true
//            view.backgroundColor = .red
        }
        print("view2")
        view2.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        view2.heightAnchor.constraint(equalToConstant: 170).isActive = true
//        view2.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
//        view2.backgroundColor = .blue
        
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 14),
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)
//            stackView.heightAnchor.constraint(equalToConstant: view.frame.height)
            ])
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            infoLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            
            infoTextView.topAnchor.constraint(equalTo: infoLabel.topAnchor, constant: 20),
            infoTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            infoTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            infoTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            
            valueTextView.topAnchor.constraint(equalTo: view2.topAnchor, constant: 5 + 20),
            valueTextView.leftAnchor.constraint(equalTo: view2.leftAnchor, constant: 0),
            valueTextView.bottomAnchor.constraint(equalTo: view2.bottomAnchor, constant: 0),
            valueTextView.rightAnchor.constraint(equalTo: view2.rightAnchor, constant: 0)
            ])
        
        
        
    }
    
}
 

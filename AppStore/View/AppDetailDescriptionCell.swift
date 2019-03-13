//
//  AppDetailDescriptionCell.swift
//  AppStore
//
//  Created by NDS on 14/02/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

class AppDetailDescriptionCell: BaseCell {
    
    let descTextView: UITextView = {
        let tv = UITextView()
        tv.text = "SAMPLE DESCRIPTION"
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.textColor = .gray
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
        
        addSubview(descTextView)
        addSubview(dividerLineView)
        
        descTextView.translatesAutoresizingMaskIntoConstraints = false
        dividerLineView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descTextView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 14),
            descTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            descTextView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            descTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
//            descTextView.widthAnchor.constraint(equalToConstant: frame.width - 14),
//            descTextView.heightAnchor.constraint(equalToConstant: frame.height),
            
            dividerLineView.heightAnchor.constraint(equalToConstant: 0.5),
            dividerLineView.topAnchor.constraint(equalTo: descTextView.bottomAnchor, constant: 1),
            dividerLineView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            dividerLineView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 14)
            ])
    }
}

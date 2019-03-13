//
//  AppDetailController.swift
//  AppStore
//
//  Created by NDS on 11/02/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

extension Sequence {
    public func toDictionary<Key: Hashable>(with selectKey: (Iterator.Element) -> Key) -> [Key:Iterator.Element] {
        var dict: [Key:Iterator.Element] = [:]
        for element in self {
            dict[selectKey(element)] = element
        }
        return dict
    }
}

class AppDetailController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
   
    var app: inLineOfApp? {
        didSet {
            if app?.Screenshots != nil {
//                print(app?.appInformation?[].Name)
                return
            }
            if let id = app?.Id {
                ServiceJSon.sharedInstance.fetchDetailApps(id: id) { (data) in
                    self.app = data
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    private let headerId = "headerId"
    private let cellId = "cellId"
    private let appDetailCellId = "appDetailCellId"
    private let appDetailInfoCellId = "appInfoCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .white
        
        collectionView.register(AppDetailHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: headerId)
        collectionView.register(ScreenshotsCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(AppDetailDescriptionCell.self, forCellWithReuseIdentifier: appDetailCellId)
        collectionView.register(AppDetailInfo.self, forCellWithReuseIdentifier: appDetailInfoCellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 1 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appDetailCellId, for: indexPath) as! AppDetailDescriptionCell
            cell.descTextView.attributedText = descriptionAttributedText()
            return cell
            
        } else if indexPath.item == 2 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appDetailInfoCellId, for: indexPath) as! AppDetailInfo
            cell.infoTextView.attributedText = informationAttributedText(id: 1)
            cell.valueTextView.attributedText = informationAttributedText(id: 2)
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScreenshotsCell
        cell.app = app
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 1 {
            let dummySize = CGSize(width: view.frame.width - 8 - 8, height: 1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin)
            let rect = descriptionAttributedText().boundingRect(with: dummySize, options: options, context: nil)
        
//            print(rect.height)
            
            return CGSize(width: view.frame.width, height: rect.height + 40)
            
        } else if indexPath.item == 2 {
            
            return CGSize(width: view.frame.width, height: 170)
        }
        
        return CGSize(width: view.frame.width , height: 170)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppDetailHeader
        header.app = app
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 170)
    }
    
    private func descriptionAttributedText() -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "Description\n", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 10
        
        let range = NSMakeRange(0, attributedText.string.characters.count)
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: range)
        
        if let desc = app?.description {
            attributedText.append(NSAttributedString(string: desc, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.darkGray]))
        }
        
        return attributedText
    }
    
    private func informationAttributedText(id: Int) -> NSAttributedString {

        let attributedText = NSMutableAttributedString()

        let style = NSMutableParagraphStyle()
        

        if let count = app?.appInformation?.count {
            for index in 0...count - 1 {
                let name = app?.appInformation?[index].Name
                let value = app?.appInformation?[index].Value
                
                if id == 1 {
                    style.alignment = .right
                    attributedText.append(NSAttributedString(string: "\(name!)\n", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.darkGray, NSAttributedString.Key.paragraphStyle: style]))
                } else if id == 2 {
                    style.alignment = .left
                    attributedText.append(NSAttributedString(string: "\(value!)\n", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.darkGray, NSAttributedString.Key.paragraphStyle: style]))
                }
                
            }

        }

        return attributedText
    }
    
}

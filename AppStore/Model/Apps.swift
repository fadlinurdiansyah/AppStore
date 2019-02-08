//
//  Apps.swift
//  AppStore
//
//  Created by NDS on 08/02/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON


struct Apps: JSONDecodable {
    
    let name: String
    let category: String
    let price: Float
    let imageName: String
    
    init(json: JSON) {
        self.name = json["Name"].stringValue
        self.category = json["Category"].stringValue
        self.price = json["Price"].floatValue
        self.imageName = json["ImageName"].stringValue
    }
}

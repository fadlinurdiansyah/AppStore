//
//  Categories.swift
//  AppStore
//
//  Created by NDS on 08/02/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Categories: JSONDecodable {
    let name: String
    var apps = [String: Any]()
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.apps = (json["apps"].dictionary)!
    }
}

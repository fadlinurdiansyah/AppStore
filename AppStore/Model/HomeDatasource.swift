//
//  HomeDatasource.swift
//  AppStore
//
//  Created by NDS on 08/02/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

extension Collection where Iterator.Element == JSON {
    func decode<T: JSONDecodable>() throws -> [T] {
        return try map{try T(json: $0)}
    }
}

class HomeDatasource: JSONDecodable {
    
    let categories: [Categories]
//    let apps: [Apps]
    
    required init(json: JSON) throws {
        guard let categoriesJsonArray = json["categories"].array else {
            throw NSError(domain: "com.nds.apps.AppStore", code: 1, userInfo: [NSLocalizedDescriptionKey: " Parsing JSON was not valid"])
        }
        self.categories = try categoriesJsonArray.decode()
//        self.apps = try appsJsonArray.decode()
        print(categories)
//        print(apps)
    
    }
    
    
}

//
//  Service.swift
//  AppStore
//
//  Created by NDS on 08/02/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let sharedInstance = Service()
    
    func fetchFeatureApps() {
        
        let request: APIRequest<HomeDatasource, JSONError> = tron.swiftyJSON.request("/appstore/featured")
        request.perform()
        
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
    
}


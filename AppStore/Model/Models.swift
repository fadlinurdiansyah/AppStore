////
////  Models.swift
////  AppStore
////
////  Created by NDS on 07/02/19.
////  Copyright © 2019 NDS. All rights reserved.
////
//
import UIKit


class ServiceJSon {
    
    
    static let sharedInstance = ServiceJSon()
    
    // MARK: Fugsi untuk conver JSON ke struct
    func fetchFeaturedApps(customCompletionHandler: @escaping (allCategories) -> Void) {
        
        // set url rest API
        let jsonUrl = "https://api.letsbuildthatapp.com/appstore/featured"
        guard let url = URL(string: jsonUrl) else { fatalError("error") }
        
        // Memasukan nilai json ke variable data
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {print(error!);return}
            do {
                // Memasukan nilai json pada variable data ke struct all categories (decode json format)
                    let decodedApps = try JSONDecoder().decode(allCategories.self, from: data!)
                    DispatchQueue.main.async {
                        customCompletionHandler(decodedApps)
                    }
                }catch let err {
                    print("Error serializing json: \(err)")
                }
        }.resume()
    }
    
    func fetchDetailApps(id: Int, CustomeCompletionHandler: @escaping (inLineOfApp) -> Void) {
        
        let jsonUrl = "https://api.letsbuildthatapp.com/appstore/appdetail?id=\(id)"
//        print(jsonUrl)
        guard let url = URL(string: jsonUrl) else { fatalError() }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil { print(error!);return }
            do {
                
                let decodeData = try JSONDecoder().decode(inLineOfApp.self, from: data!)
                DispatchQueue.main.async {
                    CustomeCompletionHandler(decodeData)
                }
            } catch let err {
                print("Error serializing json: \(err)")
            }
        }.resume()
    }
}




struct allCategories: Decodable {
    let bannerCategory: lineOfApp?
    let categories: [lineOfApp]?
}

struct lineOfApp: Decodable {
    let name: String?
    let apps: [inLineOfApp]?
    let type: String?
}

struct inLineOfApp: Decodable {
    let Id: Int?
    let Name: String?
    let Category: String?
    let ImageName: String?
    let Price: Double?
    
    let Screenshots: [String]?
    let description: String?
    let appInformation: [appInfo]?
}

struct appInfo: Decodable {
    let Name: String?
    let Value: String?
}








//
//class AppCategory: NSObject {
//
//    var name: String?
//    var apps: [App]?
//
//
//
//
////    static func fetchFeaturedApps() {
////        let defaultSession = URLSession(configuration: .default)
////        var dataTask: URLSessionDataTask?
////
////        dataTask?.cancel()
////
////        if var urlString = URLComponents(string: "https://api.letsbuildthatapp.com") {
////            urlString.path = "/appstore/featured/"
////            guard let url = urlString.url else { return }
////            dataTask = defaultSession.dataTask(with: url, completionHandler: { (data, response, error) in
////
////                if error != nil {
////                    print("Error Task:\(error)")
////                    return
////                }
////                do {
////
//////                    let json = try JSONDecoder.decode(self, from: data) as! [String: AnyObject]
////                    print(json)
////                    var appCategories = [AppCategory]()
////                    for dict in json["categories"] as! [[String: AnyObject]] {
////                        let appCategory = AppCategory()
////                        appCategory.setValuesForKeys(dict)
////                        appCategories.append(appCategory)
////                    }
////                    print(appCategories)
////
////                } catch let err {
////                    print(err)
////                }
////
////            })
////        dataTask?.resume()
////        }
////
////    }
//
//
//
//    // Fungsi input array AppCategory
//    static func sampleAppCategories() -> [AppCategory] {
//
//        let bestNewAppsCategory = AppCategory()
//        bestNewAppsCategory.name = "Best New Apps"
//
//        let bestNewGamesCategory = AppCategory()
//        bestNewGamesCategory.name = "Best New Games"
//
//
//
//        //Set array new apps
//        var newApps = [App]()
//
//        let frozenApp = App()
//        frozenApp.name = "Disney Build it: Frozen"
//        frozenApp.category = "Entertaiment"
//        frozenApp.imageName = "frozen"
//        frozenApp.price = NSNumber(value: 3.99)
//        newApps.append(frozenApp)
//        bestNewAppsCategory.apps = newApps
//
//
//        //Set array best new games
//        var newGames = [App]()
//        let telepaintApp = App()
//        telepaintApp.name = "Telepain"
//        telepaintApp.category = "Games"
//        telepaintApp.imageName = "telepaint"
//        telepaintApp.price = NSNumber(value: 2.99)
//        newGames.append(telepaintApp)
//        bestNewGamesCategory.apps = newGames
//
//        return [bestNewAppsCategory, bestNewGamesCategory]
//    }
//}
//
//class App: NSObject {
//
//    var id: NumberFormatter?
//    var name: String?
//    var category: String?
//    var imageName: String?
//    var price: NSNumber?
//}
//

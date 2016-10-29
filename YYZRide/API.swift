//
//  API.swift
//  YYZRide
//
//  Created by Yevhen Kim on 2016-10-28.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

import Foundation

class API {
    
    func getData() {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url = URL(string: "http://restbus.info/api/agencies/ttc/routes")
        
        let task = session.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] {
                        print(json)
                    }
                }
                catch {
                    print("error in json serialization")
                }
            }
        })
        task.resume()
    }
}

//
//  RestfulService.swift
//  mTunes
//
//  Created by Ali Gungor on 28.06.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit
import Alamofire

class RestfulService {

    static func getRequest(urlString: String, completion: @escaping ([String: Any]) -> Void) {
        Alamofire.request(urlString).responseJSON { (response) in
            if let responseJSON = response.value as? [String: Any] {
                completion(responseJSON)
            } else {
                print("something gone wrong")
                completion([String: Any]())
            }
        }
    }
    
}

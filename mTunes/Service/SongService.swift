//
//  SongService.swift
//  mTunes
//
//  Created by Ali Gungor on 28.06.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit

class SongService {

    static func getSongs(completion: @escaping ([Song]) -> Void) {
        var songs = [Song]()
        RestfulService.getRequest(urlString: "https://rss.itunes.apple.com/api/v1/us/apple-music/hot-tracks/all/50/explicit.json") { (response) in
            guard let feedDictionary = response["feed"] as? [String: Any] else {
                completion(songs)
                print("feed not found")
                return
            }
            
            guard let resultsDictonary = feedDictionary["results"] as? [[String: Any]] else {
                completion(songs)
                print("feed.results not found")
                return
            }
            
            songs = resultsDictonary.map({ Song(dictionary: $0) })
            completion(songs)
        }
    }
    
}

//
//  Song.swift
//  mTunes
//
//  Created by Ali Gungor on 28.06.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit

class Song {

    public var artistUrl = ""
    public var artistId = 0
    public var artistName = ""
    public var artworkUrl100 = ""
    public var collectionName = ""
    public var copyright = ""
    public var id = 0
    public var kind = ""
    public var name = ""
    public var releaseDate = ""
    public var url = ""
    
    init(dictionary: [String: Any]) {
        artistUrl = dictionary["artistUrl"] as? String ?? ""
        artistId = dictionary["artistId"] as? Int ?? 0
        artistName = dictionary["artistName"] as? String ?? ""
        artworkUrl100 = dictionary["artworkUrl100"] as? String ?? ""
        collectionName = dictionary["collectionName"] as? String ?? ""
        copyright = dictionary["copyright"] as? String ?? ""
        id = dictionary["id"] as? Int ?? 0
        kind = dictionary["kind"] as? String ?? ""
        name = dictionary["name"] as? String ?? ""
        releaseDate = dictionary["releaseDate"] as? String ?? ""
        url = dictionary["url"] as? String ?? ""
    }
    
}

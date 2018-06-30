//
//  SongsViewModel.swift
//  mTunes
//
//  Created by Ali Gungor on 28.06.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit

class SongsViewModel: NSObject {
    
    private var songs = [Song]()
    var songsCount: Int {
        return songs.count
    }
    
    func loadSongs(completion: @escaping () -> Void) {
        SongService.getSongs { (songs) in
            self.songs = songs
            completion()
        }
    }
    
    func song(at index: Int) -> Song {
        return songs[index]
    }
    
}

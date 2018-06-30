//
//  iPhoneMainViewController.swift
//  mTunes
//
//  Created by Ali Gungor on 28.06.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit
import Kingfisher

class iPhoneMainViewController: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var songsViewModel: SongsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        songsViewModel.loadSongs {
            self.tableView.reloadData()
            self.indicator.stopAnimating()
        }
    }

}

extension iPhoneMainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songsViewModel.songsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SongTableViewCell
        let song = songsViewModel.song(at: indexPath.row)
        cell.songLabel.text = song.name
        cell.artistNameLabel.text = song.artistName
        cell.artworkImageView.kf.setImage(with: URL(string: song.artworkUrl100)!)
        return cell
    }
    
}

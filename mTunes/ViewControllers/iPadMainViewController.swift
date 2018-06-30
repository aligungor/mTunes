//
//  iPadMainViewController.swift
//  mTunes
//
//  Created by Ali Gungor on 28.06.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit

class iPadMainViewController: UIViewController {
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet var songsViewModel: SongsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        songsViewModel.loadSongs {
            self.collectionView.reloadData()
            self.indicator.stopAnimating()
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: nil, completion: { _ in
            self.flowLayout.invalidateLayout()
        })
    }

}

extension iPadMainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songsViewModel.songsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SongCollectionViewCell
        let song = songsViewModel.song(at: indexPath.row)
        cell.songLabel.text = song.name
        cell.artistNameLabel.text = song.artistName
        cell.artworkImageView.kf.setImage(with: URL(string: song.artworkUrl100)!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if self.view.frame.size.width > self.view.frame.size.height {
            return CGSize(width: ((self.view.frame.size.width / 3) - 24), height: 100)
        }
        return CGSize(width: ((self.view.frame.size.width / 2) - 16), height: 100)
    }
    
}

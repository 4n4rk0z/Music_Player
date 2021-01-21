//
//  InitialViewController.swift
//  MusicPlayer
//
//  Created by 4n4rk0z on 21/01/21.
//

import UIKit

class InitialViewController: UIViewController {
    
    var songs = [Song]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setSongs()
    }
    
    private  func setSongs() {
        songs.append(Song(name: "The Hand That Feed",
                          albumName: "With Teeth",
                          artistName: "Nien inch Nails",
                          imageName: "NIN",
                          trackName: "NIN"))
        songs.append(Song(name: "The Outsider",
                          albumName: "Emotive",
                          artistName: "A Perfect Circle",
                          imageName: "APC",
                          trackName: "APC"))
        songs.append(Song(name: "Song 3",
                          albumName: "Unknown",
                          artistName: "Stone Sour",
                          imageName: "SS",
                          trackName: "SS"))
        songs.append(Song(name: "Dont Look Back in anger",
                          albumName: "Unknown",
                          artistName: "Oasis",
                          imageName: "Oasis",
                          trackName: "Oasis"))
        songs.append(Song(name: "Guapa",
                          albumName: "SabHop",
                          artistName: "Sabino",
                          imageName: "Music_Placeholder",
                          trackName: "Sabino"))
    }

}


extension InitialViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 136)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SongsCollectionViewCell
        let item = songs[indexPath.item]
        cell.imgSongImage.image = UIImage(named: item.imageName)
        cell.lblArtist.text = item.artistName
//        cell.lblSongName.text = item.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let position = indexPath.row
        
        guard let vc = storyboard?.instantiateViewController(identifier: "MP") as? MPViewController else {
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }
}



struct Song{
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}

//
//  SongsCollectionViewCell.swift
//  MusicPlayer
//
//  Created by 4n4rk0z on 21/01/21.
//

import UIKit

class SongsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var vContainer: UIView!
    @IBOutlet weak var imgSongImage: UIImageView!
    @IBOutlet weak var lblArtist: UILabel!
    @IBOutlet weak var lblSongName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        vContainer.layer.cornerRadius = 10
        vContainer.layer.shadowOffset = CGSize(width: 0, height: 3)
        vContainer.layer.shadowOpacity = 0.2
        vContainer.layer.shadowRadius = 3
        imgSongImage.layer.cornerRadius = 10
    }
    
}

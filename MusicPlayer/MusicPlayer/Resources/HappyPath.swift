//
//  HappyPath.swift
//  MusicPlayer
//
//  Created by 4n4rk0z on 21/01/21.
//

import Foundation

public class HappyPath: NSObject {
    
    var songs = [Song]()
    
    func setSongs() {
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
                          imageName: "Sabino",
                          trackName: "Sabino"))
    }
    
}

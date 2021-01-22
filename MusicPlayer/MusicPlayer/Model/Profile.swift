//
//  Profile.swift
//  MusicPlayer
//
//  Created by 4n4rk0z on 22/01/21.
//

import Foundation

public class Profile {
    
    var userName: String
    var Name: String
    var pat: String
    var mat: String
    var bio: String
    
    init(user: String, name: String, pat: String, mat: String, bio: String){
        self.userName = user
        self.Name = name
        self.pat = pat
        self.mat = mat
        self.bio = bio
    
    }
    
}

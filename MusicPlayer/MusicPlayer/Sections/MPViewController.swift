//
//  MPViewController.swift
//  MusicPlayer
//
//  Created by 4n4rk0z on 21/01/21.
//

import AVFoundation
import UIKit

class MPViewController: UIViewController {
    
    public var position: Int = 0
    public var songs: [Song] = []
    
    @IBOutlet var holderView: UIView!
    
    private let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let songNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let artisNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let albumNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let playPauseButton = UIButton()
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if holderView.subviews.count == 0 {
            configurePlayer()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let player = player {
            player.stop()
        }
    }
    

    func initUI() {
        
        let song = songs[position]
        
        //MARK:- ImageDisc
        albumImageView.frame = CGRect(x: 10,
                                      y: 10,
                                      width: holderView.frame.size.width - 20,
                                      height: holderView.frame.size.width - 20)
        albumImageView.image = UIImage(named: song.imageName)
        holderView.addSubview(albumImageView)
        
        //MARK:- Labels
    
        songNameLabel.frame = CGRect(x: 10,
                                     y: albumImageView.frame.size.height + 10,
                                     width: holderView.frame.size.width-20,
                                     height: 70)
        
        albumNameLabel.frame = CGRect(x: 10,
                                     y: albumImageView.frame.size.height + 10 + 30,
                                     width: holderView.frame.size.width-20,
                                     height: 70)
        
        artisNameLabel.frame = CGRect(x: 10,
                                     y: albumImageView.frame.size.height + 10 + 60,
                                     width: holderView.frame.size.width-20,
                                     height: 70)
        
        songNameLabel.text = song.name
        albumNameLabel.text = song.albumName
        artisNameLabel.text = song.artistName
        
        songNameLabel.textColor = .white
        albumNameLabel.textColor = .white
        artisNameLabel.textColor = .white
        
        holderView.addSubview(songNameLabel)
        holderView.addSubview(albumNameLabel)
        holderView.addSubview(artisNameLabel)
        
        //MARK:- Controls
    
        let nextButton = UIButton()
        let backButton = UIButton()
        
        let yPosition = artisNameLabel.frame.origin.y + 65
        let size: CGFloat = 30
        
        playPauseButton.frame = CGRect(x: (holderView.frame.size.width - size) / 2.0,
                                       y: yPosition,
                                       width: size,
                                       height: size)
        
        nextButton.frame = CGRect(x: holderView.frame.size.width - size - 20,
                                       y: yPosition,
                                       width: size,
                                       height: size)
        
        backButton.frame = CGRect(x: 20,
                                       y: yPosition,
                                       width: size,
                                       height: size)
        
        playPauseButton.addTarget(self, action: #selector(didTapPlayPause), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        
        playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        nextButton.setBackgroundImage(UIImage(systemName: "forward.fill"), for: .normal)
        backButton.setBackgroundImage(UIImage(systemName: "backward.fill"), for: .normal)
        
        playPauseButton.tintColor = .white
        nextButton.tintColor = .white
        backButton.tintColor = .white
        
        holderView.addSubview(playPauseButton)
        holderView.addSubview(nextButton)
        holderView.addSubview(backButton)
        

        //MARK:- Sliders
        let slider = UISlider(frame: CGRect(x: 20,
                                            y: holderView.frame.size.height-60,
                                            width: holderView.frame.size.width-40,
                                            height: 50))
        slider.value = 0.5
        slider.addTarget(self, action: #selector(didSlide(setSlider:)), for: .valueChanged)
        holderView.addSubview(slider)
    }
    
    
    @objc func didSlide(setSlider slider: UISlider) {
        //MARK:- Adjust Volume
        let value = slider.value
        player?.volume = value
    }
    
    @objc func didTapBack() {
        if position > 0 {
            position = position - 1
            player?.stop()
            for subview in holderView.subviews {
                subview.removeFromSuperview()
            }
            configurePlayer()
        }
    }
    
    @objc func didTapNext() {
        if position < (songs.count - 1) {
            position = position + 1
            player?.stop()
            for subview in holderView.subviews {
                subview.removeFromSuperview()
            }
            configurePlayer()
        }
    }
    
    @objc func didTapPlayPause() {
        if player?.isPlaying == true {
            player?.pause()
            playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
        }
        else {
            player?.play()
            playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }
    
    private func configurePlayer() {
        
        let song = songs[position]
        let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else {
                return
            }
            
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            
            guard let player = player else {
                return
            }
            player.volume = 0.5
            player.play()
        }
        catch {
            print("error aqui")
        }
        initUI()
    
     }
    
    
}

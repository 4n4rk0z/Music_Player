//
//  ProfileViewController.swift
//  MusicPlayer
//
//  Created by 4n4rk0z on 21/01/21.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imgImageProfile: UIImageView!
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAp: UILabel!
    @IBOutlet weak var lblAm: UILabel!
    @IBOutlet weak var txtbxBio: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    
    let db: DBHelper = DBHelper()
    var person: [Profile] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        person = db.read()
        initUI()

    }
    
    
    func initUI() {
        if person.first?.userName == "" {
            hideAll()
        }else{
            btnEdit.setTitle("Editar", for: .normal)
            lblUser.text = person.first?.userName
            lblName.text = person.first?.Name
            lblAp.text = person.first?.pat
            lblAm.text = person.first?.mat
            txtbxBio.text = person.first?.bio
        }
    
    }
    
    
    private func hideAll() {
        lblUser.isHidden = true
        lblName.isHidden = true
        lblAp.isHidden = true
        lblAm.isHidden = true
        txtbxBio.isHidden = true
        btnEdit.setTitle("Ingresa!", for: .normal)
        
    }
    
    private func roundImage(){
        imgImageProfile.layer.borderWidth = 1
        imgImageProfile.layer.masksToBounds = false
        imgImageProfile.layer.borderColor = UIColor.black.cgColor
        imgImageProfile.layer.cornerRadius = imgImageProfile.frame.height/2
        imgImageProfile.clipsToBounds = true
    }

    
    
}

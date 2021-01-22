//
//  EditProfileViewController.swift
//  MusicPlayer
//
//  Created by 4n4rk0z on 21/01/21.
//

import UIKit

class EditProfileViewController: BaseViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var par: UITextField!
    @IBOutlet weak var mat: UITextField!
    @IBOutlet weak var bio: UITextView!
    
    let db: DBHelper = DBHelper()
    var profile: [Profile] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

 
    }
    
    @IBAction func saveData(_ sender: Any) {
        let usr = userName.text ?? ""
        let nm = name.text ?? ""
        let pt = par.text ?? ""
        let mt = mat.text ?? ""
        let bi = bio.text ?? ""
        db.insert(username: usr,
                  name: nm,
                  pat: pt,
                  mat: mt,
                  bio: bi)
        navigationController?.popViewController(animated: true)
    }
    
}

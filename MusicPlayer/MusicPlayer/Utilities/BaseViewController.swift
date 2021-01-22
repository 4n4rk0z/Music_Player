//
//  BaseViewController.swift
//  MusicPlayer
//
//  Created by 4n4rk0z on 22/01/21.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboard()

    }
    
    func dismissKeyboard(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKB))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKB() {
        view.endEditing(true)
    }
    

}
extension BaseViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

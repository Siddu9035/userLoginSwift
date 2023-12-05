//
//  ViewController.swift
//  userLogin
//
//  Created by siddappa tambakad on 04/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.layer.cornerRadius = 8
        signUpButton.layer.borderWidth = 1
        signUpButton.layer.borderColor = UIColor.white.cgColor
        
        loginButton.layer.cornerRadius = 8
    }


    @IBAction func onPressLogin(_ sender: UIButton) {
        
    }
    @IBAction func onPressSignUp(_ sender: UIButton) {
        
    }
}


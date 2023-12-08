//
//  VerifiedVc.swift
//  userLogin
//
//  Created by siddappa tambakad on 07/12/23.
//

import UIKit

class VerifiedVc: UIViewController {
    
    
    @IBOutlet var doneButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        doneButton.layer.cornerRadius = 25
    }
    
    
    @IBAction func onPressDoneButton(_ sender: UIButton) {
        
//        let goToLoginVc = UIStoryboard(name: "Main", bundle: nil)
//            .instantiateViewController(withIdentifier: "LoginVc")
//        goToLoginVc.modalPresentationStyle = .fullScreen
//        self.present(goToLoginVc, animated: true)
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let goToLoginVc = storyBoard.instantiateViewController(withIdentifier: "LoginVc") as? LoginVc {
            navigationController?.pushViewController(goToLoginVc, animated: true)
        }
        
    }
}

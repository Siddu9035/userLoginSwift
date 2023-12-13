//
//  myCollectionVc.swift
//  userLogin
//
//  Created by siddappa tambakad on 11/12/23.
//

import UIKit

class myCollectionVc: UICollectionViewCell {

    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var numberTextLabel: UILabel!
    @IBOutlet var myView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
//        myView.backgroundColor = UIColor.lightGray
        myView.layer.borderWidth = 1
    }

}

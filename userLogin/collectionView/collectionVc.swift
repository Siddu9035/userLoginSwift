//
//  collectionVc.swift
//  userLogin
//
//  Created by siddappa tambakad on 11/12/23.
//

import UIKit

class collectionVc: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet var collectionViewc: UICollectionView!
    
    var cellArray: [CellData] = [
    CellData(topImage: "one", imageTextName: "One"),
    CellData(topImage: "two", imageTextName: "Two"),
    CellData(topImage: "three", imageTextName: "Three"),
    CellData(topImage: "four", imageTextName: "Four"),
    CellData(topImage: "five", imageTextName: "Five"),
    CellData(topImage: "six", imageTextName: "Six"),
    CellData(topImage: "seven", imageTextName: "Seven"),
    CellData(topImage: "eight", imageTextName: "Eight"),
    CellData(topImage: "six", imageTextName: "Nine"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCollectionVc()
    }
    
    func registerCollectionVc() {
        collectionViewc.register(UINib(nibName: "myCollectionVc", bundle: nil), forCellWithReuseIdentifier: "ReuseCollection")
        collectionViewc.delegate = self
        collectionViewc.dataSource = self
        
//        collectionViewc.layer.backgroundColor = UIColor.lightGray.cgColor
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 130, height: 150)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionViewc.collectionViewLayout = layout
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let data = cellArray[indexPath.row]
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReuseCollection", for: indexPath) as! myCollectionVc
        collectionCell.imageView1.image = UIImage(named: data.topImage)
        collectionCell.numberTextLabel.text = data.imageTextName
        return collectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 130)
    }

}

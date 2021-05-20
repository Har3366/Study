//
//  SmileCell.swift
//  CollectionView
//
//  Created by Игорь on 20.05.2021.
//

import UIKit

class SmileCell: UICollectionViewCell {
    
    @IBOutlet weak var smileImage: UIImageView!
    
    func setSmileImage(imageName: String) {
        smileImage.image = UIImage(named:imageName)
    }
}

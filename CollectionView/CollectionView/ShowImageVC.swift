//
//  ShowImageVC.swift
//  CollectionView
//
//  Created by Игорь on 20.05.2021.
//

import UIKit

class ShowImageVC: UIViewController {
    var imageName: String!
    
    @IBOutlet weak var currentImage: UIImageView!
    
    func setImageName (imageName : String) {
        self.imageName = imageName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentImage.image = UIImage(named: imageName)
       
    }
    


}

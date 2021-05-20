//
//  ViewController.swift
//  ExploreCollectionVC
//
//  Created by Игорь on 12.05.2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var CollectionVC: UICollectionView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionVC.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        return cell
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionVC.delegate = self
        CollectionVC.dataSource = self
    }


}


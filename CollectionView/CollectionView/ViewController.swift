//
//  ViewController.swift
//  CollectionView
//
//  Created by Игорь on 20.05.2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
 
    

    @IBOutlet weak var collectionViewOne: UICollectionView!
    
    @IBOutlet weak var collectionViewTwo: UICollectionView!
    let arrayTemperatue = [
        "temp.green",
        "temp.blackGreen",
        "temp.darkYellow",
        "temp.lightYellow",
        "temp.orange",
        "temp.red"
    ]
    
    let arraySmile = [
        "favorite",
        "bad",
        "hate",
        "nice",
        "notPleasant",
        "routine"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewOne.delegate = self
        collectionViewOne.dataSource = self
        
        collectionViewTwo.delegate = self
        collectionViewTwo.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ShowImageVC") as? ShowImageVC else {
            return
        }
        var currentSelectedImage: String!
        if collectionView == collectionViewOne {
            currentSelectedImage = arrayTemperatue[indexPath.row]
        }
        if collectionView == collectionViewTwo {
            currentSelectedImage = arraySmile[indexPath.row]
        }
        
        vc.setImageName(imageName: currentSelectedImage)
        present(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewOne {
            return arrayTemperatue.count
        }
        if collectionView == collectionViewTwo {
            return arraySmile.count
        }
       return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionViewOne {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellOne", for: indexPath) as? Cell{
                let imageName = arrayTemperatue[indexPath.row]
                cell.setTemperatureImage(imageName: imageName)
                return cell
                
            }
            
        }
        
        if collectionView == collectionViewTwo {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "smileCell", for: indexPath) as? Cell{
                let imageName = arraySmile[indexPath.row]
                cell.setSmileImage(imageName: imageName)
                return cell
                
            }
            
        }
        return UICollectionViewCell()
    }
    
}


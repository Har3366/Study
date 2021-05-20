//
//  CollectionVC1.swift
//  ExploreCollectionVC
//
//  Created by Игорь on 12.05.2021.
//

import UIKit

private let customReuseIdentifier = "CustomItemCell"

struct StructCustomItem {
    let image: String
    let textOne: String
    let textTwo: String
}

class CollectionVC1: UICollectionViewController {

    var arrayCustomItems = [StructCustomItem]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //collectionView.delegate = self
        let xib = UINib(nibName: customReuseIdentifier, bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: customReuseIdentifier)
        
        
        arrayCustomItems.append(StructCustomItem(image: "temp.lightYellow", textOne: "TextOne", textTwo: "ItemOne"))
        arrayCustomItems.append(StructCustomItem(image: "temp.orange", textOne: "TextTwo", textTwo: "ItemTwo"))
        arrayCustomItems.append(StructCustomItem(image: "temp.red", textOne: "TextThree", textTwo: "ItemThree"))
    }

    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
       
        return 1
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//           return CGSize(width: 200, height: 240)
//      }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrayCustomItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customReuseIdentifier, for: indexPath) as? CustomItemCell{
            cell.customImage.image = UIImage(named: arrayCustomItems[indexPath.row].image)
            cell.customLabel1.text = arrayCustomItems[indexPath.row].textOne
            cell.customLabel2.text = arrayCustomItems[indexPath.row].textTwo
//            cell.customLabel1.textColor = .systemYellow
//            cell.customLabel2.textColor = .systemYellow
            return cell
        }
        
        return UICollectionViewCell()
    }

}

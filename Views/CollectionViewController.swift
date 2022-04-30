//
//  CollectionViewController.swift
//  waterfalldemo
//
//  Created by Girish Parate on 30/04/22.
//

import UIKit
import CHTCollectionViewWaterfallLayout

class CollectionViewController: UICollectionViewController, CHTCollectionViewDelegateWaterfallLayout {
    
    // Get data form JSON
    let imageData: [Image] = Bundle.main.decode("data.json")

    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageList()
    }
    
    func setupImageList() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //MARK: CHTCollectionViewWaterfallLayout Start
        
        let layout = CHTCollectionViewWaterfallLayout()
        layout.itemRenderDirection = .leftToRight
        layout.columnCount = 2
        layout.sectionInset = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6)
        
        //MARK: CHTCollectionViewWaterfallLayout End
        
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    //MARK: List / Data size
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.count
    }
    
    //MARK: ImageItem CellForItem
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Create cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageItem", for: indexPath) as! ImageItemCell
        
        let item = imageData[indexPath.row]
        
        let imageURL = item.urls?.small ?? ""
        let height = item.height!
        let width = item.width!
        let hash = item.blur_hash ?? "LEHV6nWB2yk8pyo0adR*.7kCMdnj"
        cell.setImage(imageURL: imageURL, hash: hash, width: width, height: height)
        
        return cell
    }
    
    //MARK: The fun part
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Get Image size
        let item = imageData[indexPath.row]
        let height = item.height!
        let width = item.width!
        
        let imageSize = CGSize(width: width, height: height)
        return imageSize
    }
}

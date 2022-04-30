//
//  ImageItemCell.swift
//  waterfalldemo
//
//  Created by Girish Parate on 30/04/22.
//

import UIKit
import SDWebImage

class ImageItemCell: UICollectionViewCell {
    
    @IBOutlet weak var imageItem: UIImageView!
    
    func setImage(imageURL: String,hash: String,width: Int,height: Int) {
        
        //1. Hash 2. imagesize CGSize
        
        let imageWidth = width / 120 //smaller size
        let imageHeight = height / 120
        let renderSize = CGSize(width: imageWidth, height: imageHeight)
        
        //Set Image
        imageItem.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage.init(blurHash: hash, size: renderSize))
    }
}

//
//  StackImagesCollectionViewCell.swift
//  ToDoListingApp
//
//  Created by Erem Karalar on 26.03.2021.
//

import UIKit

class StackImagesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var stackImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
//Rather accesing directly while dequeuing, we call this func
    public func configure(with image:UIImage){
        stackImageView.image = image
    }
//   Registering the cell in Collection View
    static func nib() -> UINib{
        return UINib(nibName: "StackImagesCollectionViewCell", bundle: nil)
    }

}

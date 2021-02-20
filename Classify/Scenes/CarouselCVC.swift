//
//  CarouselCVC.swift
//  Classify
//
//  Created by Arsalan Khan on 19/02/2021.
//

import UIKit

class CarouselCVC: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func prepareForReuse() {
        imgView.image = nil
    }
}

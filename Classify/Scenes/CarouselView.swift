//
//  CarouselView.swift
//  Classify
//
//  Created by Arsalan Khan on 20/02/2021.
//

import UIKit

class CarouselView: UIView, NibLoadable {

    @IBOutlet weak var cvImages: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var lblTotal: UILabel!
    
    
    // Datasource for image carousel
    var images = [String]() {
        didSet {
            self.pageControl.numberOfPages = images.count
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupFromNib()
        
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupFromNib()
        
        commonInit()
    }

    
    func commonInit() {
        
        cvImages.layer.cornerRadius = 12.0
        cvImages.clipsToBounds = true
        
        let nibName = UINib(nibName: "CarouselCVC", bundle:nil)
        cvImages.register(nibName, forCellWithReuseIdentifier: "imageCell")
        
        cvImages.dataSource = self
        cvImages.delegate = self
    }
}

extension CarouselView : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! CarouselCVC
        
        let urlStr = images[indexPath.row]
        
        cell.imgView.backgroundColor = .systemGray
        cell.imgView.contentMode = .scaleAspectFill
        
        do {
            try cell.imgView.setImage(urlStr)
        }catch {            
            // Apply placeholder or color
            cell.imgView.backgroundColor = .systemGray4
        }
        
        return cell
    }
    
}

extension CarouselView : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: 162)
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let count = scrollView.contentOffset.x / scrollView.frame.size.width
        self.pageControl.currentPage = Int(count)
        
        // update page number
        self.lblTotal.text = "\(count)/\(images.count)"
    }
}

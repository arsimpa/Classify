//
//  ListingCell.swift
//  Classify
//
//  Created by Arsalan Khan on 19/02/2021.
//

import UIKit

class ListingCell: UITableViewCell {

    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var viewCarousel: CarouselView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
    
        contentView.backgroundColor = .clear
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        contentView.backgroundColor = .clear
    }

    func setupCell(_ model: ClassifiedAdViewModel.ViewModel) {
        
        lblTime.text = model.date
        lblPrice.text = model.price
        lblTitle.text = model.name
        
        // Carousel setup
        viewCarousel.images = model.imageUrlsThumbnails        
    }
}

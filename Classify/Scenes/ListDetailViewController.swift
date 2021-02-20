//
//  ListDetailViewController.swift
//  Classify
//
//  Created by Arsalan Khan on 19/02/2021.
//  
//

import Foundation
import UIKit

class ListDetailViewController: UIViewController, StoryboardLoadable {

    @IBOutlet weak var carouselView: CarouselView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    // MARK: Properties

    var presenter: ListDetailPresentation?
    var detailViewModel: ClassifiedAdViewModel.ViewModel!

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTime.text = detailViewModel.date
        lblPrice.text = detailViewModel.price
        lblTitle.text = detailViewModel.name
        
        carouselView.images = detailViewModel.imageUrls
    }
}

extension ListDetailViewController: ListDetailView {
    // TODO: implement view output methods
}

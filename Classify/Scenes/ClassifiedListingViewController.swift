//
//  ClassifiedListingViewController.swift
//  Classify
//
//  Created by Arsalan Khan on 18/02/2021.
//  
//

import Foundation
import UIKit

class ClassifiedListingViewController: UIViewController, StoryboardLoadable {

    // MARK: Properties
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModelArray = [ClassifiedAdViewModel.ViewModel]()
    
    var presenter: ClassifiedListingPresentation?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.alpha = 0.0
        tblView.separatorStyle = .none
        
        initViper()
        
        presenter?.presentListings()
    }
    
    func initViper() {
        
        let presenter = ClassifiedListingPresenter()
        let router = ClassifiedListingRouter()
        let interactor = ClassifiedListingInteractor()

        self.presenter =  presenter

        presenter.view = self
        presenter.router = router
        presenter.interactor = interactor

        router.view = self

        interactor.output = presenter
    }
}

extension ClassifiedListingViewController: ClassifiedListingView {
    
    func displayLoader() {
        activityIndicator.startAnimating()
    }
    
    func hideLoader() {
        activityIndicator.stopAnimating()
    }
    
    func displayList(_ list: ClassifiedAdViewModel.ViewModelArray) {
        
        viewModelArray = list.viewModels
        self.tblView.reloadData()
        
        UIView.animate(withDuration: 0.3) {
            self.tblView.alpha = 1.0
        }
    }
    
    func display(_ errStr: String) {
        print(errStr)
    }
}


extension ClassifiedListingViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell") as! ListingCell
        
        let model = viewModelArray[indexPath.row]
        
        cell.setupCell(model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showListDetail(indexPath.row, viewModel: viewModelArray[indexPath.row])
    }
}

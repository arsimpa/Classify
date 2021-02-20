//
//  ClassifiedListingPresenter.swift
//  Classify
//
//  Created by Arsalan Khan on 18/02/2021.
//  
//

import Foundation

class ClassifiedListingPresenter {

    // MARK: Properties

    weak var view: ClassifiedListingView?
    var router: ClassifiedListingWireframe?
    var interactor: ClassifiedListingUseCase?
}

extension ClassifiedListingPresenter: ClassifiedListingPresentation {
    
    func presentListings() {
        
        DispatchQueue.main.async { [weak self] in
            self?.view?.displayLoader()
        }
        
        interactor?.fetchListings()
    }
    
    func showListDetail(_ index: Int, viewModel: ClassifiedAdViewModel.ViewModel) {
        
        if let view = view {
            router?.navigateListToDetail(view, withData: viewModel)
        }
        
    }
}

extension ClassifiedListingPresenter: ClassifiedListingInteractorOutput {
   
    func errorInFetchingList(_ error: ClassifiedAdViewModel.FetchError) {
        
        DispatchQueue.main.async { [weak self] in
            self?.view?.hideLoader()
            self?.view?.display(error.error)
        }
    }
    
    
    func listFetched(_ response: ClassifiedAdViewModel.Response) {
        
        // process data and make presentable form
        
        guard let results = response.classifiedResponse.results else {
            
            DispatchQueue.main.async { [weak self] in
                self?.view?.hideLoader()
                self?.view?.display("Results not received")
            }
            
            return
        }
        
        let dateFormatter = DateFormatter()
        
        let classifiedViewModels: [ClassifiedAdViewModel.ViewModel] = results.map({ (classified) in
            
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSSSS"
            
            let dDate = dateFormatter.date(from: classified.createdAt)
            let prettyDate = dDate?.pretty ?? ""
            
            return ClassifiedAdViewModel.ViewModel(date: prettyDate, price: classified.price, name: classified.name, uid: classified.uid, imageIds: classified.imageIds, imageUrls: classified.imageUrls, imageUrlsThumbnails: classified.imageUrlsThumbnails)
        })
        
        DispatchQueue.main.async { [weak self] in
            self?.view?.hideLoader()
            self?.view?.displayList(ClassifiedAdViewModel.ViewModelArray(viewModels: classifiedViewModels))
        }
    }
}

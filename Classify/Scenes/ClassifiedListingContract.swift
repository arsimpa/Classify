//
//  ClassifiedListingContract.swift
//  Classify
//
//  Created by Arsalan Khan on 18/02/2021.
//  
//

import Foundation

protocol ClassifiedListingView: class {
    // TODO: Declare view methods
    
    func displayList(_ list: ClassifiedAdViewModel.ViewModelArray)
    func displayLoader()
    func hideLoader()
    func display(_ errStr: String)
    
}

protocol ClassifiedListingPresentation: class {
    
    func presentListings()
    func showListDetail(_ index: Int, viewModel: ClassifiedAdViewModel.ViewModel)
}

protocol ClassifiedListingUseCase: class {
    
    func fetchListings()
}

protocol ClassifiedListingInteractorOutput: class {

    func listFetched(_ response: ClassifiedAdViewModel.Response)
    func errorInFetchingList(_ error: ClassifiedAdViewModel.FetchError)
}

protocol ClassifiedListingWireframe: class {
    func navigateListToDetail(_ view: ClassifiedListingView, withData: ClassifiedAdViewModel.ViewModel)
}

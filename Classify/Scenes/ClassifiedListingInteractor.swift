//
//  ClassifiedListingInteractor.swift
//  Classify
//
//  Created by Arsalan Khan on 18/02/2021.
//  
//

import Foundation

class ClassifiedListingInteractor {

    // MARK: Properties

    weak var output: ClassifiedListingInteractorOutput?
}

extension ClassifiedListingInteractor: ClassifiedListingUseCase {

    func fetchListings() {
        
        ListFetchWorker().fetchClassifiedAds { [weak self] (resp, err) in
            
            guard err == nil else {
                self?.output?.errorInFetchingList(ClassifiedAdViewModel.FetchError(error: err!.localizedDescription))
                return
            }
            
            guard let resp = resp else {
                self?.output?.errorInFetchingList(ClassifiedAdViewModel.FetchError(error: "Data not received"))
                return
            }
                        
            self?.output?.listFetched(ClassifiedAdViewModel.Response(classifiedResponse: resp))
        }
    }
    
}

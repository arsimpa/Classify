//
//  ClassifiedAdViewModel.swift
//  Classify
//
//  Created by Arsalan Khan on 18/02/2021.
//

import Foundation

struct ClassifiedAdViewModel {
    
    struct Response {
        let classifiedResponse: APIResponse
    }
    
    struct FetchError {
        let error: String
    }
    
    struct ViewModel {
        
        let date: String
        let price: String
        let name: String
        let uid: String
        let imageIds: [String]
        let imageUrls: [String]
        let imageUrlsThumbnails: [String]
        
    }
    
    struct ViewModelArray {
        let viewModels : [ViewModel]
    }
}

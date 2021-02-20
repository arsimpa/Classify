//
//  ClassifiedAd.swift
//  Classify
//
//  Created by Arsalan Khan on 18/02/2021.
//

import Foundation

// MARK: - API Response
struct APIResponse: Codable {
    let results: [Classified]?
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}

// MARK: - createdAt
struct Classified: Codable {
    let createdAt: String
    let price: String
    let name: String
    let uid: String
    let imageIds: [String]
    let imageUrls: [String]
    let imageUrlsThumbnails: [String]
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case price = "price"
        case name = "name"
        case uid = "uid"
        case imageIds = "image_ids"
        case imageUrls = "image_urls"
        case imageUrlsThumbnails = "image_urls_thumbnails"
    }
}

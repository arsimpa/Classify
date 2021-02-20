//
//  ListFetchWorker.swift
//  Classify
//
//  Created by Arsalan Khan on 18/02/2021.
//

import Foundation

final class ListFetchWorker {
    
    private var client: HttpClient
    
    init(client: HttpClient = HttpClient()) {
        self.client = client
    }
    
    @discardableResult
    func fetchClassifiedAds(completion: @escaping (APIResponse?, ServiceError?) -> ()) -> URLSessionDataTaskProtocol? {
        
        return client.load(path: "default/dynamodb-writer", method: .get, params: [:]) { result, error in
            
            guard error == nil else {
                completion(nil, error!)
                return
            }
            
            if let data = result as? Data {
            
                let newJSONDecoder = JSONDecoder()
                
                do {
                    let json = try newJSONDecoder.decode(APIResponse.self, from: data)
                    completion(json , error)
                } catch (let err) {
                    completion(nil, ServiceError.custom(err.localizedDescription))
                }
                
            }
        }
    }
}

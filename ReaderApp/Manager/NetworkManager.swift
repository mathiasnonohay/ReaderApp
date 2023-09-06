//
//  NetworkManager.swift
//  ReaderApp
//
//  Created by Mathias Nonohay on 06/09/2023.
//

import Foundation
import FirebaseDatabase

class NetworkManager {
    
    private let database = Database.database().reference()
    private let baseURL = "authorlist"
    
    func fetchData(completion:@escaping(Result<AuthorResponse, Error>) -> Void) {
        database.child(baseURL).getData { error, data in
            if let error {
                completion(.failure(error))
            } else {
                guard let value = data?.value as? [[String: String]] else {
                    return
                }
                
                let authorList : AuthorResponse = value.compactMap {
                    guard let name = $0["name"],
                          let lifePeriod = $0["life_period"],
                          let biography = $0["link"],
                          let link = $0["biography"] else {
                        return nil
                    }
                    
                    return AuthorResponseElement(name: name, link: link, lifePeriod: lifePeriod, biography: biography)
                }
                
                completion(.success(authorList))
            }
        }
    }
}


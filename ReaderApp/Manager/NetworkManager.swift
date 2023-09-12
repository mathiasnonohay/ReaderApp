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
    private let authorDetailURL = "authordetail"
    
    func fetchData(completion:@escaping(Result<AuthorResponse, Error>) -> Void) {
        database.child(baseURL).getData { error, data in
            if let error {
                completion(.failure(error))
            } else {
                guard let value = data?.value as? [[String: String]] else {
                    return
                }
                
                let authorList : AuthorResponse = value.enumerated().compactMap { (index, element) in
                    guard let name = element["name"],
                          let lifePeriod = element["life_period"],
                          let biography = element["link"],
                          let link = element["biography"] else {
                        return nil
                    }
                    
                    return AuthorResponseElement(id: index.description, name: name, link: link, lifePeriod: lifePeriod, biography: biography)
                }
                
                completion(.success(authorList))
            }
        }
    }
    
    func fetchAuthorDetail(from id: String, completion:@escaping(Result<AuthorDetail, Error>) -> Void) {
        database.child(authorDetailURL).child(id).getData { error, data in
            if let error {
                completion(.failure(error))
            } else {
                guard let value = data?.value as? [String: Any],
                      let description = value["description"] as? String,
                      let fullName = value["full_name"] as? String,
                      let workList = value["works"] as? [[String: String]],
                      let author = value["author"] as? [String: String],
                      let lifePeriod = author["life_period"]
                else { return }
                
                let works: [Work] = workList.compactMap {
                    guard let title = $0["title"],
                          let publishYear = $0["publish_year"],
                          let link = $0["link"] else {
                        return nil
                    }
                    
                    return Work(title: title, date: publishYear, link: link)
                }
                
                completion(.success(AuthorDetail(name: fullName,
                                                 lifePeriod: lifePeriod,
                                                 description: description,
                                                 works: works)))
            }
        }
    }
}


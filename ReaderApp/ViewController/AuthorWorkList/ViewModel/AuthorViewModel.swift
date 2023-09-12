//
//  AuthorViewModel.swift
//  ReaderApp
//
//  Created by Mathias Nonohay on 28/08/2023.
//

import Foundation
import UIKit

class AuthorViewModel {
//    let authorName: String?
//    let period: String?
//    let portrait: UIImage?
//    let description: String?
//    let works: [Work]?
    
    func fetchAuthorDetail(from author: String, completion: @escaping(Result<AuthorDetail, Error>) -> Void) {
        NetworkManager().fetchAuthorDetail(from: author, completion: { result in
            switch result {
            case .success(let authorDetail):
                completion(.success(authorDetail))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}

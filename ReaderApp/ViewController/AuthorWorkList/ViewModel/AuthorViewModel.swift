//
//  AuthorViewModel.swift
//  ReaderApp
//
//  Created by Mathias Nonohay on 28/08/2023.
//

import Foundation
import UIKit

class AuthorViewModel {
    let authorName: String?
    let period: String?
    let portrait: UIImage?
    let description: String?
    let works: [Work]?
    
    init(author: Author) {
        self.authorName = author.name
        self.period = author.lifePeriod
        self.portrait = author.portrait
        self.description = author.description
        self.works = author.works
    }
}

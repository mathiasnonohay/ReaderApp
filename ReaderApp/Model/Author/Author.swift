//
//  Author.swift
//  ReaderApp
//
//  Created by Mathias Nonohay on 24/08/2023.
//

import UIKit

struct AuthorMock {
    let identifier: String
    let portrait: UIImage
    let name: String
    let lifePeriod: String
    let phrase: String?
    let description: String
    let works: [Work]
}

struct AuthorDetail {
    let name: String
    let lifePeriod: String
    let description: String
    let works: [Work]
    
    enum CodingKeys: String, CodingKey {
        case name, description
        case lifePeriod = "life_period"
        case works
    }
}

// MARK: - CardResponseElement
struct AuthorResponseElement: Codable {
    let id, name, link, lifePeriod, biography: String

    enum CodingKeys: String, CodingKey {
        case id, name, link
        case lifePeriod = "life_period"
        case biography
    }
}

typealias AuthorResponse = [AuthorResponseElement]


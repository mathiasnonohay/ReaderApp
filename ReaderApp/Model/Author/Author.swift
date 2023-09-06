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

// MARK: - CardResponseElement
struct AuthorResponseElement: Codable {
    let name, link, lifePeriod, biography: String

    enum CodingKeys: String, CodingKey {
        case name, link
        case lifePeriod = "life_period"
        case biography
    }
}

typealias AuthorResponse = [AuthorResponseElement]


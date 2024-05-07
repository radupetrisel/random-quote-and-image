//
//  RandomImage.swift
//  random-quote-and-image
//
//  Created by Radu Petrisel on 07.05.2024.
//

import Foundation

struct RandomImage: Decodable {
    let imageData: Data
    let quote: Quote
}

struct Quote: Decodable {
    let content: String
}

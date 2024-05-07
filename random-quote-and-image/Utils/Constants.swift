//
//  Constants.swift
//  random-quote-and-image
//
//  Created by Radu Petrisel on 07.05.2024.
//

import Foundation

enum Constants {
    enum URLs {
        static func getRandomImageURL() -> URL? {
            URL(string: "https://picsum.photos/200/300?uuid=\(UUID())")
        }
        
        static func randomQuoteURL() -> URL? {
            URL(string: "https://api.quotable.io/random")
        }
    }
}

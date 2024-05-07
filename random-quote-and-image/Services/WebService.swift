//
//  WebService.swift
//  random-quote-and-image
//
//  Created by Radu Petrisel on 07.05.2024.
//

import Foundation

final class WebService {
    func getRnadomImages(_ ids: [Int]) async throws -> [RandomImage] {
        var randomImages = [RandomImage]()
        
        for id in ids {
            let randomImage = try await getRandomImage(id)
            randomImages.append(randomImage)
        }
        
        return randomImages
    }
    
    private func getRandomImage(_ id: Int) async throws -> RandomImage {
        guard let randomImageURL = Constants.URLs.getRandomImageURL() else { throw NetworkError.badURL }
        
        guard let randomQuoteURL = Constants.URLs.randomQuoteURL() else { throw NetworkError.badURL }
        
        async let (imageData, _) = URLSession.shared.data(from: randomImageURL)
        async let (quoteData, _) = URLSession.shared.data(from: randomQuoteURL)
        
        guard let quote = try? JSONDecoder().decode(Quote.self, from: try await quoteData) else { throw NetworkError.decoding }
        
        return RandomImage(imageData: try await imageData, quote: quote)
    }
}

enum NetworkError: Error {
    case badURL
    case decoding
}

//
//  RandomImageListViewModel.swift
//  random-quote-and-image
//
//  Created by Radu Petrisel on 07.05.2024.
//

import Foundation

@Observable
final class RandomImageListViewModel {
    var randomImages = [RandomImageViewModel]()
    
    func getRandomImages(_ ids: [Int]) async {
        do {
            let randomImages = try await WebService().getRnadomImages(ids)
            self.randomImages = randomImages.map(RandomImageViewModel.init(randomImage:))
        } catch {
            print(error)
        }
    }
}

struct RandomImageViewModel: Identifiable {
    let id = UUID()
    let randomImage: RandomImage
    
    var image: Data { randomImage.imageData }
    var quote: String {  randomImage.quote.content }
}

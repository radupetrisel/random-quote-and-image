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
        randomImages = []
        
        do {
            let webService = WebService()
            
            try await withThrowingTaskGroup(of: (Int, RandomImage).self) { group in
                for id in ids {
                    group.addTask {
                        return (id, try await webService.getRandomImage(id))
                    }
                }
                
                for try await (_, randomImage) in group {
                    randomImages.append(RandomImageViewModel(randomImage: randomImage))
                }
            }
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

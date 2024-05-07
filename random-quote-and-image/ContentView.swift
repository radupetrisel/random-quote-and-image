//
//  ContentView.swift
//  random-quote-and-image
//
//  Created by Radu Petrisel on 07.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = RandomImageListViewModel()
    
    var body: some View {
        List(viewModel.randomImages) { randomImage in
            HStack {
                if let uiImage = UIImage(data: randomImage.image) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                }
                
                Text(randomImage.quote)
            }
        }
        .task {
            await viewModel.getRandomImages(Array(100...120))
        }
    }
}

#Preview {
    ContentView()
}

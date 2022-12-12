//
//  ImageViewModel.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/12.
//

import Foundation
import SwiftUI
import Nuke

class ImageViewModel: ObservableObject {
    @Published var image: UIImage

    private let url: URL

    init(urlString: String, placeholder: UIImage = UIImage()) {
        self.image = placeholder
        if let url = URL(string: urlString) {
            self.url = url
        } else {
            fatalError()
        }
        loadImage()
    }

    private func loadImage() {
        ImagePipeline.shared.loadImage(with: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.image = response.image
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

//
//  DogViewModel.swift
//  RandomDogs
//
//  Created by Spud Law on 2/12/24.
//

import Foundation

class DogViewModel {
    let api = RandomDogAPI()
    
    func getDogImageData(completion: @escaping (Data)->(Void)) {
        api.randomDog { imageURL in
            guard let url = URL(string: imageURL) else {
                print("Could not get imageURL")
                return
            }
            
            if let imageData = NSData(contentsOf: url) {
                completion(imageData as Data)
            }
        }
    }
    
    func getDogImageDataAsync() async -> Data? {
        do {
            let imageURL = try await self.api.fetchRandomDog()
            guard let url = URL(string: imageURL) else {
                print("Could not get imageURL")
                return nil
            }
            if let imageData = NSData(contentsOf: url) {
                return imageData as Data
            }
        } catch {
            return nil
        }
        return nil
    }
}

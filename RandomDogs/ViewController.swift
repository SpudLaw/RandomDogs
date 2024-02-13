//
//  ViewController.swift
//  RandomDogs
//
//  Created by Spud on 4/23/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var randomDogImageView: UIImageView!
    @IBOutlet var newImageButton: UIButton!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    private let viewModel = DogViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        Task {
            await setImageAsync()
        }
    }

    @IBAction func didTapNewImageButton() {
        activityIndicator.startAnimating()
        Task {
            await setImageAsync()
        }
    }
    
    func setImage() {
        viewModel.getDogImageData { data in
            DispatchQueue.main.async {
                self.randomDogImageView.image = UIImage(data: data)
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    func setImageAsync() async {
        guard let data = await self.viewModel.getDogImageDataAsync() else {
            print("There was a problem getting the data")
            return
        }
        randomDogImageView.image = UIImage(data: data)
        activityIndicator.stopAnimating()
    }

}


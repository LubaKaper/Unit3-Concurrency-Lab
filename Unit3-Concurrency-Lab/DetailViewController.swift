//
//  DetailViewController.swift
//  Unit3-Concurrency-Lab
//
//  Created by Liubov Kaper  on 12/9/19.
//  Copyright © 2019 Luba Kaper. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var flagImage: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var capitalLabel: UILabel!
    
    
    @IBOutlet weak var populationLabel: UILabel!
    
    var countryAllInfo: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    
    func updateUI() {
        guard let country = countryAllInfo else {
            fatalError("countryAllInfo is nil, verify prepare for seque")
        }
        
        
        
        nameLabel.text = country.name
        capitalLabel.text = "capital: \(country.capital)"
        populationLabel.text = "population: \(country.population)"
        
        let imageURL = "https://www.countryflags.io/\(country.alpha2Code)/flat/64.png"
        ImageAPIClient.getImageURL(for: imageURL) { (result) in
            switch result {
            case .failure(let appError):
            print("error\(appError)")
                
            case .success(let image):
                DispatchQueue.main.async {
                    self.flagImage.image = image
                }
            }
        }
        
    }
    

   

}

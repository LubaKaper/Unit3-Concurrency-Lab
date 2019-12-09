//
//  CountryCell.swift
//  Unit3-Concurrency-Lab
//
//  Created by Liubov Kaper  on 12/7/19.
//  Copyright © 2019 Luba Kaper. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var capitalLabel: UILabel!
    
    
    @IBOutlet weak var populationLabel: UILabel!
    
    //    func getImageURL()  {
    //
    //        let urlStringFalag = "https://www.countryflags.io/"
    //        NetworkHelper.shared.performDataTask(with: urlStringFalag) { (result) in
    //            switch result {
    //            case .failure(let appError):
    //                print("appError: \(appError)")
    //            case .success(let data):
    //                image = UIImage(data: data)
    //                DispatchQueue.main.async {
    //                    self.imageView?.image = image
    //                }
    //            }
    //        }
    //
    //
    //    }
    
    
    func configureCell(for country: Country) {
        
        nameLabel.text = country.name
        capitalLabel.text = "capital: \(country.capital)"
        populationLabel.text = "population: \(country.population)"
        
        // create an image url using interpolation with the alpha2Code
        // https://www.countryflags.io/be/flat/64.png
        
        // setting up image of a flag for a cell
        let imageURL = "https://www.countryflags.io/\(country.alpha2Code)/flat/64.png"
        ImageAPIClient.getImageURL(for: imageURL) { (result) in
            switch result {
            case .failure(let appError):
            print("error\(appError)")
                
            case .success(let image):
                DispatchQueue.main.async {
                    self.cellImage.image = image
                }
            }
        }
    }
    
}

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
    
    
    func configureCell(for country: Country) {
        nameLabel.text = country.name
        capitalLabel.text = "capital: \(country.capital)"
        populationLabel.text = "population: \(country.population)"
    }
    
}

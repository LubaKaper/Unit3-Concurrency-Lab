//
//  CountryModel.swift
//  Unit3-Concurrency-Lab
//
//  Created by Liubov Kaper  on 12/7/19.
//  Copyright © 2019 Luba Kaper. All rights reserved.
//

import Foundation

struct Country: Decodable {
   let name: String
   let capital: String
   let population: Int
   let alpha2Code: String
}

extension Country {
    static func getCountry(from data: Data) -> [Country] {
        
        var countryInfos = [Country]()
        guard let fileURL = Bundle.main.url(forResource: "countries", withExtension: "json") else {
            fatalError("could not locate json file")
        }
        do {
            let data = try Data(contentsOf: fileURL)
            let countryData = try JSONDecoder().decode([Country].self, from: data)
            countryInfos = countryData
        }catch {
            fatalError("failed to load contents \(error)")
        }
        return countryInfos
    }
}

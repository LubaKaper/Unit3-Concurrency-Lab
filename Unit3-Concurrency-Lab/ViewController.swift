//
//  ViewController.swift
//  Unit3-Concurrency-Lab
//
//  Created by Liubov Kaper  on 12/7/19.
//  Copyright © 2019 Luba Kaper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var allCountriesInfo = [Country] () {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
        tableView.delegate = self
    }
    func loadData() {
        let filename = "countries"
        let ext  = "json"
        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        allCountriesInfo = Country.getCountry(from: data)
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allCountriesInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: CountryCell!
        guard let countryCell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? CountryCell else {
            fatalError("couldn't deque countryCell")
            
        }
        cell = countryCell
        let allCountries = allCountriesInfo[indexPath.row]
        cell.configureCell(for: allCountries)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
        
    }
}


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
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var allCountriesInfo = [Country] () {
        didSet {
            tableView.reloadData()
        }
    }
    
    var searchQuary = "" {
        didSet {
            allCountriesInfo = Country.getCountry().filter {$0.name.lowercased().contains(searchQuary.lowercased())}
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
    }
    func loadData() {
        
        allCountriesInfo = Country.getCountry()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("error")
        }
        let countryInfo = allCountriesInfo[indexPath.row]
        detailVC.countryAllInfo = countryInfo
        
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

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            loadData()
            return
        }
        searchQuary = searchText
    }
}

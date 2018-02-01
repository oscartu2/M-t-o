//
//  WeatherTableViewController.swift
//  meteo
//
//  Created by Oscar on 1/31/18.
//  Copyright © 2018 oscartu. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherTableViewController: UITableViewController, UISearchBarDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weatherApi = WeatherAPIClient()
        let weatherEndpoint = WeatherEndpoint.tenDayForecast(city: "San_Francisco", state: "CA")
        weatherApi.weather(with: weatherEndpoint) { (either) in
            switch either {
            case .value(let forecastText):
                print(forecastText)
            case .error(let error):
                print(error)
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }
   

}

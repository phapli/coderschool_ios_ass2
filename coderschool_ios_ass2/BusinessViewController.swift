//
//  ViewController.swift
//  coderschool_ios_ass2
//
//  Created by Tran Tien Tin on 6/21/17.
//  Copyright © 2017 phapli. All rights reserved.
//

import UIKit

class BusinessViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var searchBar: UISearchBar!
    var searchSettings = SearchSettings()
    
    var businesses = [Business]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the UISearchBar
        searchBar = UISearchBar()
        searchBar.delegate = self
        
        // Add SearchBar to the NavigationBar
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        doSearch()
        
    }
    
    func doSearch() {
        
        
        Business.search(with: searchSettings.searchString ?? "",
                        sort: searchSettings.sortBy,
                        categories: searchSettings.category,
                        deals: searchSettings.offerDeal)
        { (businesses: [Business]?, error: Error?) in
            if let businesses = businesses {
                self.businesses = businesses
                
                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
                self.tableView.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navController = segue.destination as! UINavigationController
        let filterVC = navController.viewControllers.first as! FilterViewController
        filterVC.delegate = self
    }
    
}

// SearchBar methods
extension BusinessViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchSettings.searchString = searchBar.text
        searchBar.resignFirstResponder()
        doSearch()
    }
    
}


extension BusinessViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "businessCell") as! BusinessCell
        cell.business = businesses[indexPath.row]
        
        return cell
    }
}

extension BusinessViewController : FilterViewControllerDelegate {
    func filter(deal: Bool?, distance: Int, sortBy: Int, category: [String]?) {
        searchSettings.offerDeal = deal!
//        searchSettings.distance = distance
        searchSettings.sortBy = YelpSortMode(rawValue: sortBy)
        searchSettings.category = category
        
        doSearch()
    }
}

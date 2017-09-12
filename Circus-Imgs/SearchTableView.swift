//
//  SearchTableView.swift
//  Circus-Imgs
//
//  Created by Samuel Fary on 22/8/17.
//  Copyright © 2017 s3419529. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchResultsUpdating
{
 
    var filteredList = [String]();
    var searchList = Model.get.search
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        
        tableView.tableHeaderView = searchController.searchBar
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //tableview updates list with given search inputs
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredList.count
        }
        return Model.get.search.count
    }
    
    //determine which card to display
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "searches") as UITableViewCell!
        
        cell?.textLabel!.text = Model.get.search[indexPath.row];
        
        return cell!
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText:searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(searchText: String, scope:String = "All"){
        filteredList = searchList.filter {
            searchList in return searchList.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
}

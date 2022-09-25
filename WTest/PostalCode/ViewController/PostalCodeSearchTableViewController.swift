//
//  PostalCodeSearchTableViewController.swift
//  WTest
//
//  Created by Raphael Alkamim on 24/09/22.
//

import Foundation
import UIKit
import CoreData

class PostalCodeSearchTableViewController: UITableViewController {
    var filteredData: [PostalCodeLocal] = []
    lazy var searchBar: UISearchBar = UISearchBar()
    
    
    fileprivate func configureSearchBar() {
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = "Search"
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        view.addSubview(searchBar)
    }
    
    fileprivate func configureTableView() {
        tableView.register(PostalCodeTableViewCell.self, forCellReuseIdentifier:  PostalCodeTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Utils.shared.isAppAlreadyLaunchedOnce()
    }
    
    fileprivate func loadItems() {
        self.filteredData = PostalCodeRepository.shared.getPostalCode()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchBar()
        configureTableView()
        loadItems()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostalCodeTableViewCell.identifier, for: indexPath) as? PostalCodeTableViewCell else { fatalError("Cell not found")}
        let selectedItem = filteredData[indexPath.row]
        cell.postalCode.text = selectedItem.postalCode?.formatterPC()
        cell.postalDesignation.text = selectedItem.localyName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}



extension PostalCodeSearchTableViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        if searchText.isEmpty {
            filteredData = PostalCodeRepository.shared.getPostalCode()
            
        } else {
            let searchString = searchText.filter { "[ |\\-|\\.]".contains($0) == false }
            filteredData = PostalCodeRepository.shared.fetchPostalCode(with: searchString)
        }
        tableView.reloadData()
    }
}


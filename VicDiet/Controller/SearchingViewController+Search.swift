//
//  SearchingViewController+Search.swift
//  VicDiet
//
//  Created by Ming Yang on 6/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit


extension SearchingViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar){
        if (searchBar.text == ""){
            sv.tableView.reloadData()
            return
        }
        sv.tableView.reloadData()
        sv.isSearching = true
        sv.tableView.separatorStyle = .singleLine
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        sv.isSearching = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if(searchText == ""){
            sv.isSearching = false
            sv.tableView.separatorStyle = .none
            for i in 0...25{
                self.sv.filteredFixedDimensionalArray[i].names.removeAll(keepingCapacity: false)
            }
            self.sv.tableView.reloadData()
            return
        }
        for i in 0...25{
            self.sv.filteredFixedDimensionalArray[i].names.removeAll(keepingCapacity: false)
        }
        let predicate = searchBar.text!.lowercased()
        for i in 0...25{
            self.sv.filteredFixedDimensionalArray[i].names = self.sv.fixedDimensionalArray[i].names.filter{$0.name.lowercased().contains(predicate)}
            self.sv.filteredFixedDimensionalArray[i].names.sort(by: {$0.name < $1.name})

        }
        self.sv.isSearching = true
        sv.tableView.separatorStyle = .singleLine
        self.sv.tableView.reloadData()
        
    }
}
extension SearchForMealViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar){
        if (searchBar.text == ""){
            return
        }
        sv.isSearching = true
        sv.tableView.separatorStyle = .singleLine
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        //sv.isSearching = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        sv.isSearching = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText == ""){
            sv.isSearching = false
            sv.tableView.separatorStyle = .none
            for i in 0...25{
                self.sv.filteredFixedDimensionalArray[i].names.removeAll(keepingCapacity: false)
                
            }
            self.sv.tableView.reloadData()
            return
        }
        for i in 0...25{
            self.sv.filteredFixedDimensionalArray[i].names.removeAll(keepingCapacity: false)
        }
        let predicate = searchBar.text!.lowercased()
        for i in 0...25{
            self.sv.filteredFixedDimensionalArray[i].names = self.sv.fixedDimensionalArray[i].names.filter{$0.name.lowercased().contains(predicate)}
            self.sv.filteredFixedDimensionalArray[i].names.sort(by: {$0.name < $1.name})
            
        }
        self.sv.isSearching = true
        sv.tableView.separatorStyle = .singleLine
        self.sv.tableView.reloadData()
        
    }
    
}

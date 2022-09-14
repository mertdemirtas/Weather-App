//
//  SearchController.swift
//  MovieApp
//
//  Created by Mert Demirtaş on 23.06.2022.
//

import UIKit

class SearchController: GenericBaseSearchController<SearchControllerViewModel, SearchControllerResultViewModel, SearchControllerResultViewController> {
    
    override func prepareSearchControllerConfigurations() {
        super.prepareSearchControllerConfigurations()
        self.searchBar.delegate = self
        self.delegate = self
        self.searchBar.autocapitalizationType = .none
        self.hidesNavigationBarDuringPresentation = true
        self.definesPresentationContext = true
        self.obscuresBackgroundDuringPresentation = true
    }
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
    }
}

// MARK: - UISearchResultsUpdating
extension SearchController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.resultViewController.viewModel.abc()

    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        resultViewController.viewModel.abc()
    }
}

extension SearchController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print("aaaa")
    }
}

extension SearchController: UISearchControllerDelegate {
}


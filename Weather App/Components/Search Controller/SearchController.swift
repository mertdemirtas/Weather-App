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
        resultViewController.viewModel.itemsToDisplay.accept([SearchControllerCellCardViewData]())

    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        resultViewController.viewModel.prepareWeatherRequest(searchText: searchBar.text)
    }
}

extension SearchController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
    }
}

extension SearchController: UISearchControllerDelegate {
}


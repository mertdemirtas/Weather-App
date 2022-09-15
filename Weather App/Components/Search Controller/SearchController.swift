//
//  SearchController.swift
//  MovieApp
//
//  Created by Mert Demirtaş on 23.06.2022.
//

import UIKit

class SearchController: BaseSearchController<SearchControllerViewModel> {
    // MARK: Components
    private lazy var tableView: BaseTableView = {
        let temp = BaseTableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.registerCell(cells: [SearchControllerCell.self])
        return temp
    }()
    
    // MARK: Override Methods
    override func prepareSearchControllerConfigurations() {
        super.prepareSearchControllerConfigurations()
        searchBar.delegate = self
        delegate = self
        
        searchResultsUpdater = self
        searchBar.autocapitalizationType = .none
        hidesNavigationBarDuringPresentation = true
        definesPresentationContext = true
        obscuresBackgroundDuringPresentation = true
    }
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        bindTableView()
    }
    // MARK: Bind TableView Data
    private func bindTableView() {
        _ = self.viewModel.itemsToDisplay.bind(to: tableView.rx.items) { tableView, index, element in
            let cell: SearchControllerCell = self.tableView.dequeueReusableCell(withIdentifier: "SearchControllerCell", for: IndexPath(item: index, section: 0)) as! SearchControllerCell
            cell.setData(data: SearchControllerCellCardViewData(firstWord: element.firstWord, key: element.key))
            return cell
        }
    }
}

// MARK: - Extensions
extension SearchController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText.isEmpty) {
            self.viewModel.getSearchedWords()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.viewModel.clearData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.viewModel.prepareWeatherRequest(searchText: searchBar.text)
    }
}

extension SearchController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        self.searchResultsController?.view.isHidden = false
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        print("dsada")
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
        self.viewModel.getSearchedWords()
    }
}

extension SearchController: UISearchControllerDelegate {
}


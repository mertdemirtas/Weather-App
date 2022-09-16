//
//  SearchController.swift
//  MovieApp
//
//  Created by Mert Demirtaş on 23.06.2022.
//

import UIKit
import RxCocoa

class SearchController: BaseSearchController<SearchControllerViewModel> {
    // MARK: Components
    private lazy var tableView: BaseTableView = {
        let temp = BaseTableView()
        temp.keyboardDismissMode = .onDrag
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.registerCell(cells: [SearchControllerResultCell.self,
                                  SearchedKeywordsTableViewCell.self])
        return temp
    }()
    
    // MARK: Override Methods
    override func prepareSearchControllerConfigurations() {
        super.prepareSearchControllerConfigurations()
        searchBar.delegate = self
        delegate = self
        
        searchResultsUpdater = self
        searchBar.autocapitalizationType = .none
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
        _ = self.viewModel.displayableList.bind(to: tableView.rx.items) { tableView, index, element in
            switch element {
            case .searchedKeywords(let data):
                let cell: SearchedKeywordsTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "SearchedKeywordsTableViewCell", for: IndexPath(item: index, section: 0)) as! SearchedKeywordsTableViewCell
                cell.setData(data: data)
                cell.genericView.setButtonAction { [weak self] in
                    self?.searchBar.text = data.searchedWordText
                }
                return cell
            case .result(let data):
                let cell: SearchControllerResultCell = self.tableView.dequeueReusableCell(withIdentifier: "SearchControllerResultCell", for: IndexPath(item: index, section: 0)) as! SearchControllerResultCell
                
                cell.setData(data: data)
                cell.genericView.setButtonAction { [weak self] in
                    self?.presentingViewController?.navigationController?.pushViewController(DetailPageBuilder.build(keyValue: data.key, title: data.title), animated: true)
                }
                return cell
            }
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


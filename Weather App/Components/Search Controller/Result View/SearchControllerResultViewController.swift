//
//  SearchControllerView.swift
//  Weather App
//
//  Created by Mert Demirtaş on 14.09.2022.
//

import Foundation
import UIKit
import RxCocoa

class SearchControllerResultViewController: BaseViewController<SearchControllerResultViewModel> {
    // MARK: Components
    lazy var tableView: BaseTableView = {
        let temp = BaseTableView()
        temp.registerCell(cells: [SearchControllerCell.self])
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindTableView()
    }
    
    private func bindTableView() {
        _ = viewModel.itemsToDisplay.bind(to: tableView.rx.items) { tableView, index, element in
            let cell: SearchControllerCell = self.tableView.dequeueReusableCell(withIdentifier: "SearchControllerCell", for: IndexPath(item: index, section: 0)) as! SearchControllerCell
            cell.setData(data: SearchControllerCellCardViewData(firstWord: element.firstWord, key: element.key))
            return cell
        }
    }
    
    // MARK: Override Methods
    override func addViewComponents() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

//
//  SearchControllerView.swift
//  Weather App
//
//  Created by Mert Demirtaş on 14.09.2022.
//

import Foundation
import UIKit

class SearchControllerResultViewController: BaseViewController<SearchControllerResultViewModel> {
    lazy var tableView: BaseTableView = {
        let temp = BaseTableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

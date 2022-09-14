//
//  SearchControllerContainerView.swift
//  Weather App
//
//  Created by Mert Demirtaş on 14.09.2022.
//

import Foundation
import UIKit

class SearchControllerContainerView: GenericBaseView<SearchControllerContainerViewData> {
    // MARK: Components
    private lazy var tableView: BaseTableView = {
        let temp = BaseTableView()
        temp.dataSource = self
        temp.registerCell(cells: [SearchControllerCell.self])
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
}

extension SearchControllerContainerView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = returnData() else { return 0 }
        return data.words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

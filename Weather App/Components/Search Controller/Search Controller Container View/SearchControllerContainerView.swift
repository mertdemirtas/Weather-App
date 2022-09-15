//
//  SearchControllerContainerView.swift
//  Weather App
//
//  Created by Mert Demirtaş on 14.09.2022.
//

import Foundation
import UIKit
import RxCocoa

class SearchControllerContainerView: GenericBaseView<SearchControllerContainerViewData> {
    // MARK: Components
    private lazy var tableView: BaseTableView = {
        let temp = BaseTableView()
        temp.separatorStyle = .singleLine
        temp.registerCell(cells: [SearchControllerCell.self])
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        _ = data.words.bind(to: tableView.rx.items) { tableView, index, element in
            let cell: SearchControllerCell = self.tableView.dequeueReusableCell(withIdentifier: "SearchControllerCell", for: IndexPath(item: index, section: 0)) as! SearchControllerCell
            cell.setData(data: SearchControllerCellCardViewData(firstWord: element.firstWord, key: element.key))
            return cell
        }
    }
}

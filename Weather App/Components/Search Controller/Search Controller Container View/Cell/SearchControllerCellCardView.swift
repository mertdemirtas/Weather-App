//
//  SearchControllerCellCardView.swift
//  Weather App
//
//  Created by Mert Demirtaş on 14.09.2022.
//

import Foundation
import UIKit

class SearchControllerCellCardView: GenericBaseView<SearchControllerCellCardViewData> {
    // MARK: Constants
    private let xAxisConstraint: CGFloat = 10.0
    private let yAxisConstraint: CGFloat = 5.0

    // MARK: Components
    private lazy var title: BaseLabel = {
        let temp = BaseLabel()
        temp.textColor = .white
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: Override Methods
    override func addMajorViewComponents() {
        addSubview(title)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: yAxisConstraint),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xAxisConstraint),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -xAxisConstraint),
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -yAxisConstraint),
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        title.text = data.word ?? ""
    }
}

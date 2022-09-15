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
    private let xAxisConstraint: CGFloat = 20.0
    private let yAxisConstraint: CGFloat = 5.0

    // MARK: Components
    private lazy var containerStackView: UIStackView = {
        let temp = UIStackView()
        temp.distribution = .fill
        temp.spacing = 20.0
        temp.axis = .horizontal
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var firstWord: BaseLabel = {
        let temp = BaseLabel()
        temp.textColor = .black
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: Override Methods
    override func addMajorViewComponents() {
        addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(firstWord)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor, constant: yAxisConstraint),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xAxisConstraint),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -xAxisConstraint),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -yAxisConstraint),
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        firstWord.text = data.firstWord ?? ""
    }
}

//
//  WeatherDetailizedContainerView.swift
//  Weather App
//
//  Created by Mert Demirtaş on 13.09.2022.
//

import Foundation
import UIKit

class WeatherContainerView: GenericBaseView<WeatherContainerViewData> {
    // MARK: Constants
    private let spacingValue: CGFloat = 20.0
    
    // MARK: Components
    private lazy var containerStackView: UIStackView = {
        let temp = UIStackView()
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = spacingValue
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var dateLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.textColor = .darkGray
        temp.font = UIFont.systemFont(ofSize: 18)
        temp.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var weatherDetailComponent: WeatherDetailComponent = {
        let temp = WeatherDetailComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var atmosphericEventsCardViewComponent: AtmosphericEventsCardView = {
        let temp = AtmosphericEventsCardView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: Override Methods
    override func addMajorViewComponents() {
        addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(dateLabel)
        containerStackView.addArrangedSubview(weatherDetailComponent)
        containerStackView.addArrangedSubview(atmosphericEventsCardViewComponent)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        dateLabel.text = data.date
        weatherDetailComponent.setData(by: data.detailData)
        atmosphericEventsCardViewComponent.setData(by: data.atmosphericEventsData)
    }
}

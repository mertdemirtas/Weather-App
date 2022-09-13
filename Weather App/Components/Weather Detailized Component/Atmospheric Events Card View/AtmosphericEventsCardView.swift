//
//  AtmosphericEventsCardView.swift
//  Weather App
//
//  Created by Mert Demirtaş on 13.09.2022.
//

import Foundation
import UIKit

class AtmosphericEventsCardView: GenericBaseView<AtmosphericEventsCardViewData> {
    // MARK: Constants
    private let containerStackViewSpacingValue: CGFloat = 10.0
    
    // MARK: Components
    private lazy var containerStackView: UIStackView = {
        let temp = UIStackView()
        temp.distribution = .fillEqually
        temp.axis = .vertical
        temp.spacing = containerStackViewSpacingValue
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var rainContainerView: AtmosphericEventsContainerView = {
        let temp = AtmosphericEventsContainerView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var humidityContainerView: AtmosphericEventsContainerView = {
        let temp = AtmosphericEventsContainerView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var windContainerView: AtmosphericEventsContainerView = {
        let temp = AtmosphericEventsContainerView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: Override Methods
    override func addMajorViewComponents() {
        addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(rainContainerView)
        containerStackView.addArrangedSubview(humidityContainerView)
        containerStackView.addArrangedSubview(windContainerView)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        rainContainerView.setData(by: AtmosphericEventsData(image: "rain", name: "Rain Fall", value: String(data.rainValue) + "%"))
        humidityContainerView.setData(by: AtmosphericEventsData(image: "humidity", name: "Humidity", value: String(data.humidityValue) + "%"))
        windContainerView.setData(by: AtmosphericEventsData(image: "wind", name: "Wind", value: String(data.windValue) + "km/h"))
    }
}

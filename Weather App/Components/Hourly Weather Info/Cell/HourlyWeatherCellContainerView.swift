//
//  HourlyWeatherCellContainerView.swift
//  Weather App
//
//  Created by Mert Demirtaş on 13.09.2022.
//

import Foundation
import UIKit

class HourlyWeatherCellContainerView: GenericBaseView<HourlyWeatherCellData> {
    // MARK: Constants
    private let containerViewSpacingValue: CGFloat = 5.0
    
    // MARK: Components
    private lazy var containerStackView: UIStackView = {
        let temp = UIStackView()
        temp.axis = .horizontal
        temp.distribution = .fill
        temp.spacing = containerViewSpacingValue
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var timeLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var imageView: UIImageView = {
        let temp = UIImageView()
        temp.contentMode = .scaleAspectFill
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var temperatureLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.font = UIFont.boldSystemFont(ofSize: 17)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: Override Methods
    override func addMajorViewComponents() {
        addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(timeLabel)
        containerStackView.addArrangedSubview(imageView)
        containerStackView.addArrangedSubview(temperatureLabel)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.0),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0),
            
            imageView.widthAnchor.constraint(equalToConstant: 40.0),
            imageView.heightAnchor.constraint(equalToConstant: 40.0)
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        timeLabel.text = data.time
        imageView.image = UIImage(named: String(data.imageNumber))
        temperatureLabel.text = String(data.temperatureValue) + "°"
    }
}

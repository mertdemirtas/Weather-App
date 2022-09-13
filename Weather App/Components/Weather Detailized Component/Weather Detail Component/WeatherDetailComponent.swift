//
//  WeatherDetailComponent.swift
//  Weather App
//
//  Created by Mert Demirtaş on 13.09.2022.
//

import Foundation
import UIKit

class WeatherDetailComponent: GenericBaseView<WeatherDetailData> {
    // MARK: Constants
    private let containerViewSpacingValue: CGFloat = 10.0
    
    // MARK: Components
    private lazy var containerStackView: UIStackView = {
        let temp = UIStackView()
        temp.axis = .horizontal
        temp.distribution = .fillEqually
        temp.spacing = containerViewSpacingValue
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var weatherImage: UIImageView = {
        let temp = UIImageView()
        temp.contentMode = .scaleAspectFill
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var temperatureContainerView: UIStackView = {
        let temp = UIStackView()
        temp.axis = .vertical
        temp.distribution = .fill
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var temperatureValue: BaseLabel = {
        let temp = BaseLabel()
        temp.textAlignment = .center
        temp.font = UIFont.boldSystemFont(ofSize: 40)
        temp.textColor = .black
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var weatherPhase: BaseLabel = {
        let temp = BaseLabel()
        temp.textAlignment = .center
        temp.font = UIFont.systemFont(ofSize: 25)
        temp.textColor = .black
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: Override Methods
    override func addMajorViewComponents() {
        addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(weatherImage)
        containerStackView.addArrangedSubview(temperatureContainerView)
        
        temperatureContainerView.addArrangedSubview(temperatureValue)
        temperatureContainerView.addArrangedSubview(weatherPhase)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            weatherImage.heightAnchor.constraint(equalToConstant: 120.0)
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        weatherImage.image = UIImage(named: String(data.imageNumber))
        temperatureValue.text = String(data.temperatureValue)
        weatherPhase.text = data.weatherPhase
    }
}

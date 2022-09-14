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
        temp.axis = .vertical
        temp.distribution = .fill
        temp.spacing = containerViewSpacingValue
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var timeLabel: BaseLabel = {
        let temp = BaseLabel()
        temp.textAlignment = .center
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
        temp.textAlignment = .center
        temp.font = UIFont.boldSystemFont(ofSize: 17)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: Override Methods
    override func addMajorViewComponents() {
        layer.cornerRadius = 35.0
        backgroundColor = UIColor(r: 255, g: 255, b: 255, alpha: 0.5)
        addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(timeLabel)
        containerStackView.addArrangedSubview(imageView)
        containerStackView.addArrangedSubview(temperatureLabel)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.0),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0),
            
            imageView.widthAnchor.constraint(equalToConstant: 60.0),
            imageView.heightAnchor.constraint(equalToConstant: 60.0)
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        let convertedDate = convertDateFormater(date: data.time)
        
        timeLabel.text = convertedDate
        imageView.image = UIImage(named: String(data.imageNumber))
        temperatureLabel.text = String(data.temperatureValue) + "°"
    }
}

extension HourlyWeatherCellContainerView {
    func convertDateFormater(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        dateFormatter.locale = Locale.current

        guard let date = dateFormatter.date(from: date) else {
            return ""
        }

        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = Locale.current
        let timeStamp = dateFormatter.string(from: date)

        return timeStamp
    }
}

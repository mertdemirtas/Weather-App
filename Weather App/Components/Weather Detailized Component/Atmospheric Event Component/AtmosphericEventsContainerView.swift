//
//  AtmosphericEventComponent.swift
//  Weather App
//
//  Created by Mert Demirtaş on 13.09.2022.
//

import Foundation
import UIKit

class AtmosphericEventsContainerView: GenericBaseView<AtmosphericEventsData> {
    // MARK: Constants
    private let eventInfoSpacingValue: CGFloat = 10.0
    private let frameValue: CGFloat = 5.0
    
    // MARK: Components
    private lazy var containerStackView: UIStackView = {
        let temp = UIStackView()
        temp.distribution = .fillEqually
        temp.axis = .horizontal
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    private lazy var eventInfoStackView: UIStackView = {
        let temp = UIStackView()
        temp.distribution = .fill
        temp.axis = .horizontal
        temp.spacing = eventInfoSpacingValue
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var eventImage: UIImageView = {
        let temp = UIImageView()
        temp.contentMode = .scaleAspectFill
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var eventName: BaseLabel = {
        let temp = BaseLabel()
        temp.textColor = .black
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var eventValue: BaseLabel = {
        let temp = BaseLabel()
        temp.textColor = .black
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: Override Methods
    override func addMajorViewComponents() {
        layer.cornerRadius = 10.0
        
        addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(eventInfoStackView)
        
        eventInfoStackView.addArrangedSubview(eventImage)
        eventInfoStackView.addArrangedSubview(eventName)
        
        containerStackView.addArrangedSubview(eventValue)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor, constant: frameValue),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: frameValue),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: frameValue),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: frameValue),
        ])
    }
    
    override func loadDataView() {
        guard let data = returnData() else { return }
        eventImage.image = UIImage(named: data.image ?? "")
        eventName.text = data.name
        eventValue.text = data.value
    }
}

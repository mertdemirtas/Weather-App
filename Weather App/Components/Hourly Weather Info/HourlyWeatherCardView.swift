//
//  HourlyWeatherContainerView.swift
//  Weather App
//
//  Created by Mert Demirtaş on 13.09.2022.
//

import Foundation
import UIKit

class HourlyWeatherCardView: GenericBaseView<HourlyWeatherCardViewData> {
    // MARK: Components
    private lazy var collectionView: BaseCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 1000
        layout.minimumLineSpacing = 10
        let temp = BaseCollectionView(frame: .zero, collectionViewLayout: layout)
        temp.showsHorizontalScrollIndicator = false
        temp.dataSource = self
        temp.delegate = self
        temp.backgroundColor = .appBackgroundColor
        temp.registerCell(cells: [HourlyWeatherCollectionViewCell.self])
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: Override Methods
    override func addMajorViewComponents() {
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.collectionView.reloadInputViews()
        }
    }
}

// MARK: CollectionView Extensions
extension HourlyWeatherCardView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let data = returnData() else { return 0 }
        return data.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HourlyWeatherCollectionViewCell", for: indexPath) as? HourlyWeatherCollectionViewCell else { return BaseCollectionViewCell()}
        
        guard let data = returnData() else { return cell }
        
        cell.setData(data: data.items[indexPath.row])
        return cell
    }
}

extension HourlyWeatherCardView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.size.width / 4, height: 130.0)
    }
}

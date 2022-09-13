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
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let temp = BaseCollectionView(frame: .zero, collectionViewLayout: layout)
        temp.dataSource = self
        temp.registerCell(cells: [HourlyWeatherCollectionViewCell.self])
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
}

extension HourlyWeatherCardView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let data = returnData() else { return 0 }
        return data.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCardCollectionViewCell", for: indexPath) as? HourlyWeatherCollectionViewCell else { return BaseCollectionViewCell()}
        
        guard let data = returnData() else { return BaseCollectionViewCell()}
        
        cell.setData(data: data.items[indexPath.row])
        return cell
    }
}

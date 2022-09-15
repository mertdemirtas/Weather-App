//
//  SearchControllerContainerViewData.swift
//  Weather App
//
//  Created by Mert Demirtaş on 14.09.2022.
//

import Foundation
import RxSwift
import RxRelay

struct SearchControllerContainerViewData {
    let words: BehaviorRelay<[SearchControllerCellCardViewData]>
}

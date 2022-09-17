//
//  BaseViewModel.swift
//  MovieApp-Invio
//
//  Created by Mert Demirtaş on 1.07.2022.
//
import RxSwift

class BaseViewModel {
    var loading = BehaviorSubject<NetworkStates>(value: .done)
    
    public let networkManager = NetworkManager.shared
    
    init() {
        networkState()
    }
}

extension BaseViewModel {
    func networkState() {
        networkManager.networkStateClosure = { [weak self] state in
            switch(state) {
            case .processing:
                self?.loading.onNext(.processing)
            case .done:
                self?.loading.onNext(.done)
            case .clientError:
                self?.loading.onNext(.clientError)
            case .serverError:
                self?.loading.onNext(.serverError)
            }
        }
    }
}

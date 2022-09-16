//
//  NetworkManager.swift
//  Taxi App
//
//  Created by Mert Demirtaş on 16.04.2022.
//

import Alamofire
import Foundation

class NetworkManager {
    
    var networkStateClosure: ((NetworkStates) -> Void)?
    
    public func request<T: Codable>(from endPoint: Endpoint, completionHandler: @escaping (T) -> Void) {
        networkStateClosure?(.processing)
        // MARK: URL
        let urlString = endPoint.url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlString ?? "")!
        var urlRequest = URLRequest(url: url)
        
        // MARK: HTTP Method
        urlRequest.httpMethod = endPoint.httpMethod.rawValue
        
        AF.request(urlRequest).responseDecodable(of: T.self) { [weak self] response in
            switch response.result {
            case .success(let data):
                self?.networkStateClosure?(.done)
                completionHandler(data)
            case .failure(_):
                guard let statusCode = response.response?.statusCode else { return }
                let httpError = HTTPErrors.init(statusCode: statusCode)
                switch httpError {
                case .clientError:
                    self?.networkStateClosure?(.clientError)
                case .serverError:
                    self?.networkStateClosure?(.serverError)
                }
            }
        }
    }
}

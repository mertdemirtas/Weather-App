//
//  BaseViewController.swift
//  Taxi App
//
//  Created by Mert Demirtaş on 7.04.2022.
//

import UIKit

class BaseViewController<T: BaseViewModel>: UIViewController {
    
    var viewModel: T!
    let nav = UINavigationBarAppearance()
    var activityIndicator = UIActivityIndicatorView()
    
    
    convenience init(viewModel: T) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewControllerConfigurations()
        prepareNavigationBar()
        addViewComponents()
        spinner()
    }
    
    private func prepareViewControllerConfigurations() {
        self.view.backgroundColor = .appBackgroundColor
    }
    
    private func prepareNavigationBar() {
        nav.backgroundColor = .navBarColor
        nav.largeTitleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 32, weight: .medium)]
        
        let navBar = self.navigationController?.navigationBar
        
        navBar?.tintColor = .black
        navBar?.isTranslucent = true
        navBar?.standardAppearance = nav
        navBar?.scrollEdgeAppearance = nav
        navBar?.compactAppearance = nav
                
        prepareActivityIndicator()
    }
    
    private func prepareActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        activityIndicator.color = .black
        let barButton = UIBarButtonItem(customView: activityIndicator)
        self.navigationItem.setRightBarButton(barButton, animated: true)
    }
    
    func addViewComponents() { }
}

extension BaseViewController {
    public func spinner() {
        _ = viewModel.loading.subscribe(onNext: { [weak self] (data) in
            switch data {
            
            case .processing:
                self?.activityIndicator.startAnimating()
            case .done:
                self?.activityIndicator.stopAnimating()
            case .clientError:
                self?.activityIndicator.stopAnimating()
                break
            case .serverError:
                self?.activityIndicator.stopAnimating()
                break
            }
        })
    }
}

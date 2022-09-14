//
//  BaseSearchController.swift
//  MovieApp
//
//  Created by Mert Demirtaş on 23.06.2022.
//

import UIKit

class GenericBaseSearchController<T, ResultViewModel, ResultViewController: BaseViewController<ResultViewModel>>: UISearchController {
    
    var viewModel: T!
    var resultViewController: BaseViewController<ResultViewModel>!
    var vSpinner : UIView?
    
    init(searchResultsController: ResultViewController, viewModel: T? = nil) {
        super.init(searchResultsController: searchResultsController)
        self.resultViewController = searchResultsController
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareSearchControllerConfigurations()
        prepareViewControllerConfigurations()
    }
    func prepareSearchControllerConfigurations() { }
    func prepareViewControllerConfigurations() { }
}
extension GenericBaseSearchController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = .appBackgroundColor
        let ai = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
        ai.color = .spinnerColor
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            self.vSpinner?.removeFromSuperview()
            self.vSpinner = nil
        }
    }
}

//
//  ClassifiedListingRouter.swift
//  Classify
//
//  Created by Arsalan Khan on 18/02/2021.
//  
//

import Foundation
import UIKit

class ClassifiedListingRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> ClassifiedListingViewController {
        let viewController = UIStoryboard.loadViewController() as ClassifiedListingViewController
        let presenter = ClassifiedListingPresenter()
        let router = ClassifiedListingRouter()
        let interactor = ClassifiedListingInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension ClassifiedListingRouter: ClassifiedListingWireframe {
    
    func navigateListToDetail(_ view: ClassifiedListingView, withData: ClassifiedAdViewModel.ViewModel) {
        
        let vc = ListDetailRouter.setupModule()
        vc.detailViewModel = withData
        
        (view as? UIViewController)?.navigationController?.pushViewController(vc, animated: true)
    }
}

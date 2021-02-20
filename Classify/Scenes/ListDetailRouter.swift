//
//  ListDetailRouter.swift
//  Classify
//
//  Created by Arsalan Khan on 19/02/2021.
//  
//

import Foundation
import UIKit

class ListDetailRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> ListDetailViewController {
        let viewController = UIStoryboard.loadViewController() as ListDetailViewController
        let presenter = ListDetailPresenter()
        let router = ListDetailRouter()
        let interactor = ListDetailInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension ListDetailRouter: ListDetailWireframe {
    
}

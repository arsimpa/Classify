//
//  ListDetailPresenter.swift
//  Classify
//
//  Created by Arsalan Khan on 19/02/2021.
//  
//

import Foundation

class ListDetailPresenter {

    // MARK: Properties

    weak var view: ListDetailView?
    var router: ListDetailWireframe?
    var interactor: ListDetailUseCase?
}

extension ListDetailPresenter: ListDetailPresentation {
    // TODO: implement presentation methods
}

extension ListDetailPresenter: ListDetailInteractorOutput {
    // TODO: implement interactor output methods
}

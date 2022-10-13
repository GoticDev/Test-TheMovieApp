//
//  MoviesListPresenter.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 13/10/22.
//  
//

import Foundation

class MoviesListPresenter  {
    
    // MARK: Properties
    weak var view: MoviesListViewProtocol?
    var interactor: MoviesListInteractorInputProtocol?
    var wireFrame: MoviesListWireFrameProtocol?
    
}

extension MoviesListPresenter: MoviesListPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension MoviesListPresenter: MoviesListInteractorOutputProtocol {
    // TODO: implement interactor output methods
}

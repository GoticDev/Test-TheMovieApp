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
    var router: MoviesListRouterProtocol?
    var movieListResult = [MovieResults]()
    
}

extension MoviesListPresenter: MoviesListPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        print("vista detalle")
        interactor?.getMoviesDataInteractor()
    }
    
    func showDetailView(with data: MovieResults) {
        router?.presentMovieDetal(from: view!, withData: data)
    }
    
}

extension MoviesListPresenter: MoviesListInteractorOutputProtocol {
    // TODO: implement interactor output methods
    
    func interactorSendListMoviesData(receivedData: [MovieResults]) {
        view?.presenterSendMovieListView(receivedData: receivedData)
    }
}

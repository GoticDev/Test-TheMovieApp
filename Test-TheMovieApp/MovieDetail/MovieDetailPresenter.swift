//
//  MovieDetailPresenter.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 13/10/22.
//  
//

import Foundation

class MovieDetailPresenter  {
    
    // MARK: Properties
    weak var view: MovieDetailViewProtocol?
    var interactor: MovieDetailInteractorInputProtocol?
    var router: MovieDetailRouterProtocol?
    var movieResult: MovieResults?
}

extension MovieDetailPresenter: MovieDetailPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        print("hoola Detalle y tengo dato \(movieResult?.title)")
        if let movieResult = self.movieResult {
            view?.initialSetup(with: movieResult)
        }
        
    }
}

extension MovieDetailPresenter: MovieDetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}

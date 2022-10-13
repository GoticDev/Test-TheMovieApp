//
//  MoviesListInteractor.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 13/10/22.
//  
//

import Foundation

class MoviesListInteractor: MoviesListInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: MoviesListInteractorOutputProtocol?
    var localDatamanager: MoviesListLocalDataManagerInputProtocol?
    var remoteDatamanager: MoviesListRemoteDataManagerInputProtocol?

}

extension MoviesListInteractor: MoviesListRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}

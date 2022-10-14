//
//  MovieDetailInteractor.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 13/10/22.
//  
//

import Foundation

class MovieDetailInteractor: MovieDetailInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: MovieDetailInteractorOutputProtocol?
    var localDatamanager: MovieDetailLocalDataManagerInputProtocol?
    var remoteDatamanager: MovieDetailRemoteDataManagerInputProtocol?

}

extension MovieDetailInteractor: MovieDetailRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}

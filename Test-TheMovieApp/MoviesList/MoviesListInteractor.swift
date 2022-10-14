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
    
    var movieList: MovieListEntity?

    func getMoviesDataInteractor() {
        remoteDatamanager?.getMoviesDataManager()
    }
    
    func movieListData() -> [MovieResults] {
        guard let movieList = movieList?.results else {
            return [MovieResults]()
        }
        return movieList
    }
    
}

extension MoviesListInteractor: MoviesListRemoteDataManagerOutputProtocol {
    func sendDataMoviesList(with model: MovieListEntity) {
        // TODO: Implement use case methods
        print("si llega")
//        self.movieList = model
        presenter?.interactorSendListMoviesData(receivedData: model.results)
    }
    
    
}

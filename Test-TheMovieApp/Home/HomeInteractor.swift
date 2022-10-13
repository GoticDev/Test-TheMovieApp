//
//  HomeInteractor.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 12/10/22.
//  
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    
    func getMoviesDataInteractor() {
        remoteDatamanager?.getMoviesDataManager()
    }

}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    func sendDataMoviesList(with model: [HomeEntity]) {
        print("a ver ps")
    }
}

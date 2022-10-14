//
//  MoviesListProtocols.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 13/10/22.
//  
//

import Foundation
import UIKit

protocol MoviesListViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: MoviesListPresenterProtocol? { get set }
    func presenterSendMovieListView(receivedData: [MovieResults])
}

protocol MoviesListRouterProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createMoviesListModule() -> UIViewController
    func presentMovieDetal(from view: MoviesListViewProtocol, withData: MovieResults)
}

protocol MoviesListPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: MoviesListViewProtocol? { get set }
    var interactor: MoviesListInteractorInputProtocol? { get set }
    var router: MoviesListRouterProtocol? { get set }
    
    func viewDidLoad()
    func showDetailView(with data: MovieResults)
}

protocol MoviesListInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func interactorSendListMoviesData(receivedData: [MovieResults])
}

protocol MoviesListInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: MoviesListInteractorOutputProtocol? { get set }
    var localDatamanager: MoviesListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: MoviesListRemoteDataManagerInputProtocol? { get set }
    
    func getMoviesDataInteractor()
    func movieListData() -> [MovieResults]
}

protocol MoviesListDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol MoviesListRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: MoviesListRemoteDataManagerOutputProtocol? { get set }
    func getMoviesDataManager()
}

protocol MoviesListRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func sendDataMoviesList(with model: MovieListEntity)
}

protocol MoviesListLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}

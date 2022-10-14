//
//  MoviesListRouter.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 13/10/22.
//  
//

import Foundation
import UIKit

class MoviesListRouter: MoviesListRouterProtocol {

    class func createMoviesListModule() -> UIViewController {
        let moviesListView = mainStoryboard.instantiateViewController(withIdentifier: "MoviesListView")
        if let view = moviesListView as? MoviesListView {
            let presenter: MoviesListPresenterProtocol & MoviesListInteractorOutputProtocol = MoviesListPresenter()
            let interactor: MoviesListInteractorInputProtocol & MoviesListRemoteDataManagerOutputProtocol = MoviesListInteractor()
            let localDataManager: MoviesListLocalDataManagerInputProtocol = MoviesListLocalDataManager()
            let remoteDataManager: MoviesListRemoteDataManagerInputProtocol = MoviesListRemoteDataManager()
            let router: MoviesListRouterProtocol = MoviesListRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return moviesListView
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func presentMovieDetal(from view: MoviesListViewProtocol, withData: MovieResults) {
        let detailView = MovieDetailRouter.createMovieDetailModule(with: withData)
        if let newView = view as? UIViewController {
            newView.navigationController?.pushViewController(detailView, animated: true)
        }
    }
    
}

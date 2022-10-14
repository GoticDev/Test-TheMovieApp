//
//  MovieDetailWireFrame.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 13/10/22.
//  
//

import Foundation
import UIKit

class MovieDetailRouter: MovieDetailRouterProtocol {
    static func createMovieDetailModule(with data: MovieResults) -> UIViewController {
        let detailView = mainStoryboard.instantiateViewController(withIdentifier: "MovieDetailView")
        if let view = detailView as? MovieDetailView {
            let presenter: MovieDetailPresenterProtocol & MovieDetailInteractorOutputProtocol = MovieDetailPresenter()
            let interactor: MovieDetailInteractorInputProtocol & MovieDetailRemoteDataManagerOutputProtocol = MovieDetailInteractor()
            let localDataManager: MovieDetailLocalDataManagerInputProtocol = MovieDetailLocalDataManager()
            let remoteDataManager: MovieDetailRemoteDataManagerInputProtocol = MovieDetailRemoteDataManager()
            let router: MovieDetailRouterProtocol = MovieDetailRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            presenter.movieResult = data
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return detailView
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
}

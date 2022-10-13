//
//  MoviesListRouter.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 13/10/22.
//  
//

import Foundation
import UIKit

class MoviesListWireFrame: MoviesListWireFrameProtocol {

    class func createMoviesListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "MoviesListView")
        if let view = navController.children.first as? MoviesListView {
            let presenter: MoviesListPresenterProtocol & MoviesListInteractorOutputProtocol = MoviesListPresenter()
            let interactor: MoviesListInteractorInputProtocol & MoviesListRemoteDataManagerOutputProtocol = MoviesListInteractor()
            let localDataManager: MoviesListLocalDataManagerInputProtocol = MoviesListLocalDataManager()
            let remoteDataManager: MoviesListRemoteDataManagerInputProtocol = MoviesListRemoteDataManager()
            let wireFrame: MoviesListWireFrameProtocol = MoviesListWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
}

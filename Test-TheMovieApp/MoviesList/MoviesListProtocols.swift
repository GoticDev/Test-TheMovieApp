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
}

protocol MoviesListWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createMoviesListModule() -> UIViewController
}

protocol MoviesListPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: MoviesListViewProtocol? { get set }
    var interactor: MoviesListInteractorInputProtocol? { get set }
    var wireFrame: MoviesListWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol MoviesListInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol MoviesListInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: MoviesListInteractorOutputProtocol? { get set }
    var localDatamanager: MoviesListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: MoviesListRemoteDataManagerInputProtocol? { get set }
}

protocol MoviesListDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol MoviesListRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: MoviesListRemoteDataManagerOutputProtocol? { get set }
}

protocol MoviesListRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol MoviesListLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}

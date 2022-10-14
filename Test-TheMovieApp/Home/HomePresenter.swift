//
//  HomePresenter.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 12/10/22.
//  
//

import Foundation

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var router: HomeRouterProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
//        interactor?.getMoviesDataInteractor()
        print("me ha llamado la view")
    }
    
    func getMoviesDataPresenter() {
        interactor?.getMoviesDataInteractor()
    }
    
    func showMovieListView() {
        router?.presentMovieList(from: view!)
    }
    
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // TODO: implement interactor output methods
}

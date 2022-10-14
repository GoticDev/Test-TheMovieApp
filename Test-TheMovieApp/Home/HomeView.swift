//
//  HomeView.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 12/10/22.
//  
//

import Foundation
import UIKit

class HomeView: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var showListMovieButton: UIButton!
    
    var presenter: HomePresenterProtocol?
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
    
    @IBAction func showListMoviesAction(_ sender: Any) {
        presenter?.showMovieListView()
    }
    
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
}

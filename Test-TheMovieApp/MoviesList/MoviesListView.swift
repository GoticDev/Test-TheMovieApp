//
//  MoviesListView.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 13/10/22.
//  
//

import Foundation
import UIKit

class MoviesListView: UIViewController {

    // MARK: Properties
    var presenter: MoviesListPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MoviesListView: MoviesListViewProtocol {
    // TODO: implement view output methods
}

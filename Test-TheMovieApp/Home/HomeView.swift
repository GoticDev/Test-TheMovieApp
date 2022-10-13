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
//        ServiceManager.shared.request(url: Constants.popularUrl, httpMethod: .get, parameters: nil) { _ in
//        }
        self.presenter?.viewDidLoad()
    }
    
    @IBAction func showListMoviesAction(_ sender: Any) {
        self.presenter?.getMoviesDataPresenter()
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MoviesListView")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
}

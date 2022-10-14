//
//  MoviesListRemoteDataManager.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 13/10/22.
//  
//

import Foundation
import ProgressHUD

class MoviesListRemoteDataManager:MoviesListRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: MoviesListRemoteDataManagerOutputProtocol?
    var movieListEntity: MovieListEntity?
    
    func getMoviesDataManager() {
        ProgressHUD.show("Loading")
        ServiceManager.shared.request(url: Constants.popularUrl, httpMethod: .get, parameters: nil) { (result) in
            ProgressHUD.dismiss()
            switch result {
            case .success(let json):
                if let response = try?  JSONDecoder().decode(MovieListEntity.self, from: json.rawData()) {
                    self.movieListEntity = response
                    self.remoteRequestHandler?.sendDataMoviesList(with: self.movieListEntity!)
                } else {
                    print("Error en parseo")
                }
                    
            case .failure(let error):
                print("Error:", error.localizedDescription)
                
            }
            
        }
    }
}

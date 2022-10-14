//
//  HomeRemoteDataManager.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 12/10/22.
//  
//

import Foundation

class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    var homeEntity = [HomeEntity]()
    
    func getMoviesDataManager() {
        ServiceManager.shared.request(url: Constants.popularUrl, httpMethod: .get, parameters: nil) { (result) in
            switch result {
            case .success(let json):
                if let response = try?  JSONDecoder().decode([HomeEntity].self, from: json.rawData()) {
                    self.homeEntity = response
                    self.remoteRequestHandler?.sendDataMoviesList(with: self.homeEntity)
                } else {
                    print("Error")
                }
                    
            case .failure(let error):
                print("Error:", error.localizedDescription)
                
            }
            
        }
    }
}

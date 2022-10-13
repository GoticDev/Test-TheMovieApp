//
//  ServiceManager.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 13/10/22.
//

import Foundation
import Alamofire
import SwiftyJSON

class ServiceManager {
    static let shared = ServiceManager()
    let session = Session()
    
    func request(url: String, httpMethod: HTTPMethod, parameters: Parameters?, completion: @escaping (Result<JSON,Error>) -> Void) {
        session.request(url, method: httpMethod, parameters: parameters, encoding: JSONEncoding.default, headers: nil, interceptor: nil).responseJSON { (response) in
            switch response.result {
            case .success:
                if let data = response.data, let json = try? JSON.init(data: data) {
                    self.showRequestAndResponse(url, nil, parameters, json)
                    if let unwarappedResponse = response.response {
                        let statusCode = unwarappedResponse.statusCode
                        if statusCode == 200 {
                            completion(.success(json))
                        }
                    }
                }
            case .failure(_):
                if let unwarappedResponse = response.response {
                    let statusCode = unwarappedResponse.statusCode
                    print("failure with statuscode:", statusCode)
                }
            }
        }
        
    }
    
    func showRequestAndResponse(_ url: String, _ headerss: [String: Any]?, _ params: [String: Any]?, _ json: JSON?) {
        
        print("URL: \(url)")
        
        if let request = params?.prettyPrintedJSON {
            print("REQUEST: \(request)")
        }
        
        if let headers = headerss?.prettyPrintedJSON {
            print("HEADERS: \(headers)")
        }
        
        if let response = json {
            print("RESPONSE: \(response)")
        }
    }
    
}


extension Dictionary {
    var prettyPrintedJSON: String? {
        do {
            let data: Data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(data: data, encoding: .utf8)
        } catch _ {
            return nil
        }
    }
}

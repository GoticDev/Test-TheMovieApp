//
//  +UIImageView.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 13/10/22.
//

import Foundation
import UIKit

extension UIImageView {
    
    func imageFromUrl(urlString: String, placeHolderImage: UIImage) {
        if self.image == nil {
            self.image = placeHolderImage
        }
        
        URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error)in
            if error != nil {
                return
            }
            
            DispatchQueue.main.async {
                guard let data = data else { return }
                let image = UIImage(data: data)
                self.image = image
            }
        }.resume()
    }
    
}

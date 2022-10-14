//
//  MovieDetailView.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 13/10/22.
//  
//

import Foundation
import UIKit

class MovieDetailView: UIViewController {

    // MARK: Properties
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    
    var presenter: MovieDetailPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension MovieDetailView: MovieDetailViewProtocol {
    // TODO: implement view output methods
    func initialSetup(with data: MovieResults) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        let imageURL = Constants.imageBaseUrl + (data.poster ?? "")
        posterImage.imageFromUrl(urlString: imageURL, placeHolderImage: UIImage(systemName: "star.fill")!)
    }
    
}

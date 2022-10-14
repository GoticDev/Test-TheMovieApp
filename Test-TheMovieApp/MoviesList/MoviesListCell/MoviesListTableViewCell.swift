//
//  MoviesListTableViewCell.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 13/10/22.
//

import UIKit

class MoviesListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentCell: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func cellData(index: MovieResults) {
        titleLabel.text = index.title
        descriptionLabel.text = index.description
        let imageURL = Constants.imageBaseUrl + (index.poster ?? "")
        posterImage.imageFromUrl(urlString: imageURL, placeHolderImage: UIImage(systemName: "star.fill")!)
        
    }
    
}

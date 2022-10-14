//
//  +UIAlertController.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 14/10/22.
//

import UIKit

extension UIAlertController {
    class func show(title: String, _ message: String, alertTitle: String, from controller: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: alertTitle, style: .default))
        controller.show(alert, sender: nil)
    }
}

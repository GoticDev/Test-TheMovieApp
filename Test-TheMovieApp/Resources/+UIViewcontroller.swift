//
//  +UIViewcontroller.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 13/10/22.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.newDismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func newDismissKeyboard() {
        view.endEditing(true)
    }
    
    func alert(message: String, title: String = "") {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }

}

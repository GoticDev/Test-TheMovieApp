//
//  HomeView.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 12/10/22.
//  
//

import Foundation
import UIKit
import FirebaseStorage
import Firebase
import ProgressHUD
import CoreLocation

class HomeView: UIViewController, CLLocationManagerDelegate {

    // MARK: Properties
    @IBOutlet weak var showListMovieButton: UIButton!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var selfieButton: UIButton!
    @IBOutlet weak var selfieImage: UIImageView!
    @IBOutlet weak var sendDataButton: UIButton!
    
    var presenter: HomePresenterProtocol?
    
    let storage = Storage.storage().reference()
    var selfieData: Data?
    var reference: DatabaseReference!
    var locationManager:CLLocationManager!
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
        nameTF.delegate = self
        self.reference = Database.database().reference()
        self.hideKeyboardWhenTappedAround()
        setInitialImage()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
        }
    }
    
    private func setInitialImage() {
        guard let urlString = UserDefaults.standard.string(forKey: "url"),
        let url = URL(string: urlString) else { return }
        ProgressHUD.show()
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            ProgressHUD.dismiss()
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.selfieImage.image = image
            }
        }
        task.resume()
    }
    
    @IBAction func showListMoviesAction(_ sender: Any) {
        presenter?.showMovieListView()
    }
    
    @IBAction func selfieAction(_ sender: Any) {
        let alert = UIAlertController(title: "Alert", message: "Procederemos a tomarte una selfie", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.imagePick()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sendDataAction(_ sender: Any) {
        if let selfieData = selfieData, nameTF.text!.count > 0 {
            ProgressHUD.show()
            storage.child("images/\(nameTF.text!).png").putData(selfieData, metadata: nil) { _, error in
                guard error == nil else {
                    ProgressHUD.dismiss()
                    print(error?.localizedDescription ?? "")
                    return}
                self.storage.child("images/\(self.nameTF.text!).png").downloadURL { url, error in
                    ProgressHUD.dismiss()
                    guard let url = url, error == nil else { return }
                    let urlString = url.absoluteString
                    print("Download selfie url from Firebase storage:", urlString)
                    UserDefaults.standard.set(urlString, forKey: "url")
                    
                    self.alert(message: "Los datos fueron enviados.", title: "Listo!")
                }
            }
        } else {
            self.alert(message: "Por favor ingresa tu nombre y adjunta tu foto", title: "Alerta")
        }
    }
    
    func imagePick() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    //MARK: - location delegate methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation
        self.reference.child("Coordenadas").child("longitud").setValue("\(userLocation.coordinate.longitude)")
        self.reference.child("Coordenadas").child("latitud").setValue("\(userLocation.coordinate.latitude)")

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
    func setInitialSetup(placeHolder: String,
                         selfieButtonTitle: String,
                         sendDataButtonTitle: String,
                         showMovieListTitle: String,
                         background: UIColor) {
        nameTF.placeholder = placeHolder
        selfieButton.setTitle(selfieButtonTitle, for: .normal)
        sendDataButton.setTitle(sendDataButtonTitle, for: .normal)
        showListMovieButton.setTitle(showMovieListTitle, for: .normal)
        selfieImage.backgroundColor = background
        selfieImage.roundedImage()
    }
}


extension HomeView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {return}
        selfieImage.image = image
        
        guard let imageData = image.pngData() else { return }
        self.selfieData = imageData
    }
}

extension HomeView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: [])
            if regex.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count)) != nil {
                return false
            }
        }
        catch {
            print("ERROR")
        }
        return true
    }
}

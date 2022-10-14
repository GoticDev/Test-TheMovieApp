//
//  MoviesListView.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 13/10/22.
//  
//

import Foundation
import UIKit

class MoviesListView: UIViewController {

    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    var presenter: MoviesListPresenterProtocol?
    var movieList = [MovieResults]()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        presenter?.viewDidLoad()
    }
    
    private func setTableView() {
        let nib = UINib(nibName: "MoviesListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MoviesListTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension MoviesListView: MoviesListViewProtocol {
    // TODO: implement view output methods
    func presenterSendMovieListView(receivedData: [MovieResults]) {
        self.movieList = receivedData
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
}

extension MoviesListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesListTableViewCell", for: indexPath) as? MoviesListTableViewCell else { return UITableViewCell() }
        cell.cellData(index: movieList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDetailView(with: movieList[indexPath.row])
    }
}

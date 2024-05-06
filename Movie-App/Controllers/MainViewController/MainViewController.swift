//
//  MainViewController.swift
//  Movie-App
//
//  Created by Nguyen Anh Tuan on 5/5/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    //ViewModel
    var viewModel: MainViewModel = MainViewModel()
    
    //variables:
    var cellDataSource: [MovieTableCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        bindViewModel()
    }


    func configView () {
        self.title = "Movie"
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    func bindViewModel(){
        viewModel.isLoading.bind{ [weak self] isLoading in
                guard let self = self,
                      let isLoading = isLoading else {
                    return
                }
            DispatchQueue.main.async {
                if isLoading {
                    self.loadingView.startAnimating()
                }else{
                    self.loadingView.stopAnimating()
                    self.loadingView.hidesWhenStopped = true
                }
            }
            
            viewModel.cellDataSource.bind { [weak self] movies in
                guard let self = self,
                      let movies = movies else {
                    return
                }
                self.cellDataSource = movies
                self.reloadTableView()
            }
        }
    }

}

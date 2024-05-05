//
//  MainViewController.swift
//  Movie-App
//
//  Created by Nguyen Anh Tuan on 5/5/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //ViewModel
    var viewModel: MainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configView()
    }


    func configView () {
        self.title = "Watssup man"
        self.view.backgroundColor = .red
        setupTableView()
    }

}

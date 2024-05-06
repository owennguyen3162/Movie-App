//
//  MainViewController+TableView.swift
//  Movie-App
//
//  Created by Nguyen Anh Tuan on 5/5/24.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView () {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.backgroundColor = .clear
        self.tableView.separatorStyle = .none
        registerCell()
    }
    
    func registerCell() {
        tableView.register(MainTableViewCell.register(), forCellReuseIdentifier: MainTableViewCell.identifier)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
            
        let cellViewModel = cellDataSource[indexPath.row]
        cell.selectionStyle = .none
        cell.setupCell(viewModel: cellViewModel)
        return cell
    }
    
    func reloadTableView () {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func getMoviesTitle(_ movie: Movie) -> String {
        return movie.title ?? movie.name ?? ""
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    
}

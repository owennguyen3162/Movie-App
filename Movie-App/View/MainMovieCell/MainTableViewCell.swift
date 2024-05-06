//
//  MainTableViewCell.swift
//  Movie-App
//
//  Created by Nguyen Anh Tuan on 6/5/24.
//

import UIKit
import SDWebImage

class MainTableViewCell: UITableViewCell {

    public static var identifier: String {
        get {
            return "MainTableViewCell"
        }
    }
    
    public static func register() -> UINib {
        UINib(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var rateLable: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var nameLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initView()
    }
    
    private func initView () {
        backView.addBorder(color: .label, width: 1)
        backView.round()
        movieImageView.round()
        backView.backgroundColor = .lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell (viewModel: MovieTableCellViewModel) {
        self.rateLable.text = viewModel.rating
        self.dateLable.text = viewModel.date
        self.nameLable.text = viewModel.title
        self.movieImageView.sd_setImage(with: viewModel.imageUrl)
    }
    
    
}

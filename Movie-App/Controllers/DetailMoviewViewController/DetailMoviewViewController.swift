//
//  DetailMoviewViewController.swift
//  Movie-App
//
//  Created by Nguyen Anh Tuan on 6/5/24.
//

import UIKit
import SDWebImage

class DetailMoviewViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    
    var viewModel: DetailsMovieViewModel
    
    init(viewModel: DetailsMovieViewModel){
        self.viewModel = viewModel
        super.init(nibName: "DetailMoviewViewController", bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    func configView()
    {
        self.title = "Movie Detail"
        self.descriptionLbl.text = viewModel.movieDes
        self.imageView.sd_setImage(with: viewModel.movieImage)
        self.titleLbl.text = viewModel.movieTitle
    }


   

}

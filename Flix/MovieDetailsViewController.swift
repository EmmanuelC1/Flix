//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Emmanuel Castillo on 2/9/20.
//  Copyright © 2020 Emmanuel Castillo. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movie: [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        //Image sizes from API
        let posterSize = "w185"
        let backdropSize = "w780"
        
        //API URL
        let baseUrl = "https://image.tmdb.org/t/p/"
        
        //Setting the poster URL for the movie posters (from API)
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterSize + posterPath)
        
        //Set backdrop image on the backdropView
        posterView.af_setImage(withURL: posterUrl!)
        
        //Setting the backdrop URL for the movie backrops (from API)
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: baseUrl + backdropSize + backdropPath)
        
        //Set backdrop image on the backdropView
        backdropView.af_setImage(withURL: backdropUrl!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

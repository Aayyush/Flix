//
//  DetailViewController.swift
//  Flix
//
//  Created by Pujan Thapa on 2/11/18.
//  Copyright © 2018 Aayush Gupta. All rights reserved.
//

import UIKit

enum MovieKeys{
    static let title = "title"
    static let backdropPath = "backdrop_path"
    static let poseterPath = "poster_path"
}

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backDropImageVIew: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: [String: Any]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie{
            titleLabel.text = movie[MovieKeys.title] as? String
            releaseDateLabel.text = movie["release_date"] as? String
            overviewLabel.text = movie["overview"] as? String
            let backdropPathString = movie[MovieKeys.backdropPath] as! String
            let posterPathString = movie[MovieKeys.poseterPath] as! String
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            
            let backDropURL = URL(string: baseURLString+backdropPathString)!
            backDropImageVIew.af_setImage(withURL: backDropURL)
            
            let posterPathURL = URL(string: baseURLString + posterPathString)!
            posterImageView.af_setImage(withURL: posterPathURL)
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
